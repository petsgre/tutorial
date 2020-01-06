# 目录

### Web

- web 打印 ios 端 bug 定位(注释调试法)
- 避免 undefined 空指针等 bug(空对象合并，缺省值补充，lodash get 方法)

### 微信、小程序、H5

- 小程序字母索引的实现(借鉴 dom 思想)
- 微信公众号接口修改 hosts 本地调试(帮助开发环境调试)
- ios safari 回退 浏览器缓存页面问题（最新 safari，onpageshow 事件不触发）
- 微信 h5 页面缓存问题（包括返回不触发等）

### React

- 表单性能问题(避免 render 函数使用高阶组件，update reducer 的时候尽量分开不同的属性，使用 Reselect)
- 配置思想优先，配置让 view 代码和数据代码解耦，注意在适当的时候预留钩子

### Webpack

- 减小 vendors 包体积大小，全部 split；根据包名再分包


### 第三方库

- 阅读百度echarts源码，查看树形图 属性(使用的border代替background)，第一次读懂了大型项目代码

- 修改ant-design-pro 滚动条宽度问题

- rsuite表格获取高度问题(充分理解生命周期，在适当的时候rerender)