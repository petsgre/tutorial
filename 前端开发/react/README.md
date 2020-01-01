
## react

 <span style="color:red">不要在render函数里面使用高阶组件<span>

1. [react脚手架-webpack](https://segmentfault.com/a/1190000019126657)
2. [使用react-intl实现React组件国际化](https://www.jianshu.com/p/574f6cea4f26)
3. [不要在render函数里面使用高阶组件](https://github.com/sunyongjian/blog/issues/25)
4. [react-router配置404页面](./react/react-router配置404页面.md)
5. [Redux书写习惯](https://segmentfault.com/a/1190000010915166)
6. [React动态import()](https://www.cnblogs.com/lantuoxie/p/9104014.html)




### notes

1. React diff 优化

```
1. 暴力删除子节点，如果父节点变化了，子节点直接删除 并重新创建
2. 暴力删除子组件，如果父组件变化了(类型，结构)直接删除组件 并创建新组件
3. 根绝key判断，哪些节点需要drop，哪些需要move
```


2. 关于组件选型

要考虑团队内的成员水品，jsx的代码结构更容易扩展
react组合的方式更容易扩展

是否需要跨平台：react-native

学习成本高低：vue更低，文档简单中文，丰富的指令

敏捷开发：需要灵活性更强的框架 而react正是 函数式编程，代码更加灵活，也更贴近原生


