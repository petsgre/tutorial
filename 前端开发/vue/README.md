# Vue

### 笔记

1. preserveWhitespace vue-loader 配置这个属性可以去除多余的空格

```
{
  test: /\.vue$/,
  use: [
    {
      loader: "vue-loader",
      options: {
        compilerOptions: {
          preserveWhitespace: false
        }
      }
    }
  ]
},
```