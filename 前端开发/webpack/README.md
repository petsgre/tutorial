# webpack

前言:

> webpack 也是前端非常重要的一部分，随着前端工程化的不断深入，产品的前端要求越来越高，以及 nodejs 的出现

> 现在的前端有了更多有趣和好玩的东西，webpack 就是其中一个前端构建工具，可以把它类比为后端的 maven,gradle 等。

> 除了 webpack,前端还有其他构建工具，比如 gulp,grunt,rollup,etc...

> 但是最开始，大家可能都是使用一些仓库给的官方脚手架来使用，比如 vue-cli,react-create-app...随着工程越来越大，或者环境越来越复杂，我们需要自己来尽享一些扩展，并且如果框架从头搭建，也更能了解脚手架内部是如何实现，也就是从 how 升级到 why

> 本文主要记录自己使用 webpack 的一些方法和某个模块的具体配置，以帮助自己更加了解 webpack 的功能。

目录：

1. [webpack 概念](https://webpack.docschina.org/concepts/)
2. [webpack-nodeAPI](./webpack-nodeAPI.md)

参考：

1. [webpack 最佳配置指北](https://juejin.im/post/5e0e1153e51d45414b74de65?utm_source=gold_browser_extension)

难点解决：

1. devserver node 占用高内存

> 使用 watchOptions 来提高性能

```
watchOptions: {
  poll: false, //禁止轮询  poll可是设置number，当watch如果失败的时候轮询再编译
  aggregateTimeout: 1000, // 延迟执行编译
  ignored: /node_modules/ // 忽略不需要打包的文件 也可以使用anywatch ['xxx/**/*.js','node_modules']
},
```

Webpack 配置说明:

1. 入口

```
module.exports = {
  entry: `./index.js`,
}
```

2. 输出

```
output:{
  // path一定是绝对路径，使用reslove可以获取绝对路径
  path:'xxx/dir'，
  // 输出的文件名称
  filename:'bundle.js',
  // 相对路径 默认值是''空字符
  publicPath:'/'
}
```

> \_\_dirname: 总是返回被执行的 js 所在文件夹的绝对路径
