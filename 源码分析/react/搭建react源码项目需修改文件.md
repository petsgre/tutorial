**React版本 17.0.0**

webpack.config.js

```js
const HtmlWebpackPlugin = require("html-webpack-plugin")
const path = require("path")
const webpack = require("webpack")

module.exports = {
  entry: "./src/index.js",
  mode: "development",
  devtool: "source-map",
  devServer: {
    port: 9000,
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-flow"],
          },
        },
      },
    ],
  },
  resolve: {
    alias: {
      react: path.resolve(__dirname, "./packages/react"),
      shared: path.resolve(__dirname, "./packages/shared"),
      scheduler: path.resolve(__dirname, "./packages/scheduler"),
      "react-dom": path.resolve(__dirname, "./packages/react-dom"),
      "react-reconciler": path.resolve(
        __dirname,
        "./packages/react-reconciler"
      ),
    },
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "./src/index.html",
    }),
    new webpack.DefinePlugin({
      __DEV__: true,
      __PROFILE__: true,
      __EXPERIMENTAL__: true,
    }),
  ],
}

```



.babelrc

```json
{
  "presets": ["@babel/preset-react"]
}
```



依赖项:

```json
"scripts": {
  "start": "npx webpack serve"
},
"devDependencies": {
  "@babel/core": "^7.15.8",
  "@babel/preset-flow": "^7.14.5",
  "@babel/preset-react": "^7.14.5",
  "babel-loader": "^8.2.3",
  "html-webpack-plugin": "^5.5.0",
  "webpack": "^5.60.0",
  "webpack-cli": "^4.9.1",
  "webpack-dev-server": "^4.3.1"
},
"dependencies": {
  "object-assign": "^4.1.1"
}
```



修改文件：

- ReactFiberHostConfig.js  

```js
// invariant(false, 'This module must be shimmed by a specific renderer.');
export * from './forks/ReactFiberHostConfig.dom';
```

- ReactFiberWorkLoop.new.js / ReactFiberWorkLoop.old.js

```js
// import * as Scheduler from 'scheduler';
import * as Scheduler from 'scheduler/unstable_mock';
```

- ReactSharedInternals.js

```js
// import * as React from 'react';

// const ReactSharedInternals =
//   React.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED;
import ReactSharedInternals from "react/src/ReactSharedInternals"
```

- invariant.js

```js
if (condition) {
  return
}
```

- SchedulerHostConfig.js

```js
// throw new Error('This module must be shimmed by a specific build.');

export * from "./forks/SchedulerHostConfig.default"
```

- unstable_mock.js

```js
} from './src/forks/SchedulerHostConfig.mock';
```

