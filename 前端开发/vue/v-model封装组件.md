# 利用v-model封装组件

v-model 是一个语法糖

做了两件事 addprops 和 addevents

### 源码部分

```
// src/platforms/web/compiler/directives/model.js

addProp(el, 'value', `(${value})`)
addHandler(el, event, code, null, true)
```

并且 prop 和 event 的name是自定义的
```
// src/core/vdom/create-component.js

// transform component v-model info (value and callback) into
// prop and event handler respectively.
function transformModel (options, data: any) {
  const prop = (options.model && options.model.prop) || 'value' //自定义名字
  const event = (options.model && options.model.event) || 'input' //自定义名字
  ;(data.attrs || (data.attrs = {}))[prop] = data.model.value
  const on = data.on || (data.on = {})
  const existing = on[event]
  const callback = data.model.callback
  if (isDef(existing)) {
    if (
      Array.isArray(existing)
        ? existing.indexOf(callback) === -1
        : existing !== callback
    ) {
      on[event] = [callback].concat(existing)
    }
  } else {
    on[event] = callback
  }
}

```

### 例子

父组件绑定 v-model

子组件通过以下配置可以快速定义emit事件名，并且把v-model传过来的参数当做props解析


```
// child.vue

  model: {
    prop: 'obj',
    event: 'modifyCheck'
  },
  props: ['obj'],
  template: `
    <div>
    <input
      type="checkbox"
      v-bind:checked="value.bool"
      @change="$emit('modifyCheck',{bool:$event.target.checked,text:++value.text} )"
    >
    <div>{{value.text}}</div>
    </div>
  `
```


```
// parent.vue
  <Child v-model="obj" placeholder="Enter your name"></Child>

  data() {
    return {
      obj: {
        text: 666,
        bool: false,
      }
    }
  },
```
