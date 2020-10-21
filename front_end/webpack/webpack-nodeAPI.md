# webpack-nodeAPI

在开始学习webpack的时候，我们通常使用一下配置来运行webpack

```
const path = require('path');

module.exports = {
  entry: './path/to/my/entry/file.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'my-first-webpack.bundle.js'
  }
};
```

但是，webpack是有不同的版本的，使用module.exports的方式运行webpack，nodejs会寻找全局安装的webpack运行，如果我们的配置中有些方法当前webpack版本没有就会报错。

所以，使用nodeAPI，使用webpack就非常好用了


example：

```
const webpack = require("webpack");

webpack({
  // 配置对象
  entry: './path/to/my/entry/file.js',
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'my-first-webpack.bundle.js'
  }
}, (err, stats) => {
  if (err || stats.hasErrors()) {
    // 在这里处理错误
  }
  // 处理完成
});
```

这里webpack即是我们下载在node_modules里面的webpack，而非全局webpack

- webpack.watch

多数情况下，我们启动webpack是需要让他监听文件变化的，使用webpack.watch方法可以启动一个进程监听文件变化，当文件修改后，会再次打包

如果你不向 webpack 执行函数传入回调函数，就会得到一个 webpack Compiler 实例

```
const webpack = require("webpack");

const compiler = webpack({
  // 配置对象
});

const watching = compiler.watch({
  // watchOptions 示例
  aggregateTimeout: 300,
  poll: undefined
}, (err, stats) => {
  // 在这里打印 watch/build 结果...
  console.log(stats);
});
```

官方文档传送门：[Node.js API](https://webpack.docschina.org/api/node/)
