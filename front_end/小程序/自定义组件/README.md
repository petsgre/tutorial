# 小程序自定义组件





- [官方链接](https://developers.weixin.qq.com/miniprogram/dev/framework/custom-component/component.html)



开发组件三部曲：

1. 在项目中新建components目录，并右键新建component
2. 在需要引入组件的page.json中写入

```json

"usingComponents": {

​    "i-component": "../../components/index/index"

  },

```

3. 在page.wxml中引入标签

```

​	<i-component></i-component>

```

注意点：



- 自定义组件允许修改其中的样式，通过


```json
Component({
  externalClasses: ['my-class']
})
```

但是只能修改组件最外层标签样式

```

.a .b .c{

  width:100px;

}

```

这种情况是不生效的。



-  properties中代表外部传来的数据，类似于vue的props，可以直接当做data数据来绑定到视图中
- methods代表组件的内部事件，不同于page的方法是可以直接定义到page中，组件的方法定义在methods中
- 组件事件通信，推荐使用  this.triggerEvent('customevent', {})
