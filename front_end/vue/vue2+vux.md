# 使用vue-cli2引入vux



由于官方文档不全，一点也不傻瓜式，中间还有一些其他配置，这些配置并不在教程中，所以自己理了一遍，来使用vue-cli2引入vux



1. 下载vue-cli2初始化项目

   > npm install vue-cli -g
   >
   > vue init webpack demo
   >
   > cd demo
   >
   > npm install

   通过以上步骤，可以初始化出一个vue项目

2. 下载vux相关依赖

   > npm install vux -S
   >
   > npm install less@2.7.3 -D
   >
   > npm install less-loader -D
   >
   > npm install vux-loader@1.2.9 -D

3. 修改相关文件

```
// webpack.base.conf.js

// 原来的 module.exports 代码赋值给变量 webpackConfig
const originalConfig = {
	context: path.resolve(__dirname, '../'),
  entry: {
    app: './src/main.js'
  },
  ...
}

const vuxLoader = require('vux-loader')
const webpackConfig = originalConfig 

module.exports = vuxLoader.merge(webpackConfig, {
  plugins: ['vux-ui']
})
```

```
// App.vue


<style lang="less"> // 添加lang标签
@import '~vux/src/styles/reset.less'; // 引入vux相关less
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

```

```
// main.js

import Vue from 'vue'
import App from './App'
import router from './router'
import { AlertPlugin } from 'vux' // e.g 以弹出框为例

Vue.config.productionTip = false
const FastClick = require('fastclick') //添加快速点击，避免点击时间300ms问题
FastClick.attach(document.body)

Vue.use(AlertPlugin)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

```

```
// HelloWorld.vue

<template>
  <div class="hello">
    <group>
      <cell title="title" value="value"></cell>
    </group>
  </div>
</template>

<script>
import { Group, Cell } from 'vux'

export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  },
  components: {
    Group,
    Cell
  },
  mounted() {
    this.$vux.alert.show({
      title: 'Vux is Cool',
      content: 'Do you agree?',
      onShow() {
        console.log("Plugin: I'm showing")
      },
      onHide() {
        console.log("Plugin: I'm hiding")
      }
    })
  }
}
</script>


```

4. 最后，关于eslint的问题可以修改编辑器设置，也可以修改eslint设置，大家自己完成。

