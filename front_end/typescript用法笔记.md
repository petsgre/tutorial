### Typescript用法笔记:


1. 使用泛型定义props和state

```
class Dashboard extends React.Component<IProps, IState> {}
```

2. 使用 !在属性末尾，表示这个属性一定会存在

```
// !表示一定可以获取到这个dom节点
const a = document.getElementById('xxx')!.style
```
