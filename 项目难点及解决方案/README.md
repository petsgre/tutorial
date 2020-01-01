# 目录

### Web

- web打印 ios端 bug定位(注释调试法)
- 避免 undefined 空指针等bug(空对象合并，缺省值补充，lodash get方法)

### 微信、小程序、H5
- 小程序字母索引的实现(借鉴dom思想)
- 微信公众号接口修改hosts本地调试(帮助开发环境调试)
- ios safari 回退 浏览器缓存页面问题（最新safari，onpageshow事件不触发）
- 微信h5 页面缓存问题（包括返回不触发等）

### React

- 表单性能问题(避免render函数使用高阶组件，update reducer的时候尽量分开不同的属性，使用Reselect)
- 配置思想优先，配置让view代码和数据代码解耦，注意在适当的时候预留钩子

React性能优化:

1. 展示组件PureComponent代替Component
2. 组件懒加载，懒加载需要注意过度效果，因为js要异步加载
3. React Fragments 避免额外标记
4. 避免bind this，而是预先在constructor中定义
5. shouldComponentUpdate中做一些逻辑来判断是否需要重新渲染
6. 可添加删除的列表不要使用index作为key(可使用shortid生成简短id)
7. gzip压缩
8. 避免 ...props

### Webpack

- 减小vendors包体积大小，全部split；根据包名再分包