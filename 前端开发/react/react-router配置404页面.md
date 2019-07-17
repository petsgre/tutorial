# react router 配置404页面
使用Vue相关的技术栈2年左右了，在路由管理上一直用的比较得心应手，现在的项目使用react开发，路由自然也就切换到了react router，所用版本为react router 4

在Vue router配置中，我们可以很简单的配置出404页面
使用通配符 * 号匹配所有路由，并将此配置放在数组的最末端，当前面的路由都匹配不上时，就会匹配到 * 号，然后我们使用redirect 配置将路由重定向到404component
此配置方法不管是对于单级路由还是嵌套路由都适用，只要匹配不到，最终都可以通过 * 来redirect

```
export default new Router({
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/404',
      name: 'home',
      component: Home
    },
    {
      path: '/about',
      name: 'about',
      component: () => import(/* webpackChunkName: "about" */ './views/About.vue'),
      children: [
        {
          path: 'page1',
          name: 'page1',
          component: page1
        },
        {
          path: 'page2',
          name: 'page2',
          component: page2
        },
      ]
    },
    {
      path: '*',
      redirect: '/404'
    }
  ]
})
```

那么 react router 4 有什么不同的地方呢？

首先是配置子路由的位置不同

react router 4配置嵌套路由是在所在组件里面进行配置

```
// Parent component
	<Switch>
      <Route path="/Page" component={Page} />
      <Route path="/Sub" component={Childs} />
    </Switch>
```

```
// Child component
const Childs = ({ match }) => (
  <div>
    <Switch>
      <Route path={`/Sub/page1`} component={Page1} />
      <Route path={`/Sub/page2`} component={Page2} />
    </Switch>
  </div>
);
```
在父组件里定义好子组件
这样就可以通过 '/Sub/page1'访问到该路由页面了

其次，react router 4还在路由匹配上有些不同，R4没有通配符* ，取而代之的是在路由最后可以添加

```
<Switch>
  <Route path="/Page" component={Page} />
  <Route path="/Sub" component={Childs} />
  <Route component={NoMatch} />  // 匹配未找到的路由
</Switch>
```
参考链接：[react router官方文档](https://reacttraining.com/react-router/web/example/no-match)

这时候，我们添加404页面在根组件，it works！

但是，我们的需求往往不是这么简单，通常情况下，我们希望在所有路由情况下他都可以校验路由是否不存在

--------

problem：

在嵌套路由下，我们发现：访问 /Sub/page3'' 仍然可以看到不完整的路由页面，虽然没有匹配到page3，但是router匹配到了/Sub,这时候问题来了，子路由匹配不到404页面啊。

我查看了当前比较火的react前端解决方案 <[react-admin](https://github.com/marmelab/react-admin)>和<[ant-design-pro](https://github.com/ant-design/ant-design-pro)>,发现他们都没有全局404页面的解决方案。

查了很久文档和他人的文章，最终找到一个解决方案，借鉴出处：[一个神奇的网站](https://codepen.io/pshrmn/pen/KWeVrQ)

1. 既然R4是在父组件内部配置路由的，那么内部也要添加404匹配路由

```
// 在子组件中添加404路由
 <Switch>
  <Route path={`/Sub/page1`} component={Page1} />
  <Route path={`/Sub/page2`} component={Page2} />
  <Route component={NoMatch} />
</Switch>
```

```
// NoMatch(404)组件

class NoMatch extends React.Component {
  componentDidMount() {
  }
  render() {
    return (
      <div className="404">
        404
      </div>
    );
  }
}
```

2. 直接匹配404依然会渲染父组件，所以我们需要重定向

```
// RedirectAs404
const RedirectAs404 = ({ location }) => <Redirect to='/404' />
```

```
// 通过Redirect将当前路由重定向到
 <Switch>
  <Route path={`/Sub/page1`} component={Page1} />
  <Route path={`/Sub/page2`} component={Page2} />
  <Route component={RedirectAs404} />
</Switch>
```

3. 发现直接redirect到404不太友好，页面路径也变成了404
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190718012937373.png)
4. 在根组件添加一个state，来修改总路由配置

```
// RedirectAs404
const RedirectAs404 = ({ location }) => <Redirect to='{Object.assign({}, location, { state: { is404: true } })}' />
```

```
// App.js 这里指根组件
<Route render={({ location }) => (
  location.state && location.state.is404
    ? <NoMatch />
    : <Switch>
      	<Route path="/Page" component={Page} />
		<Route path="/Sub" component={Childs} />
        <Route component={RedirectAs404} />
    </Switch>
)} />
```
这样，不管是第几级的组件，当只要匹配到RedirectAs404组件，都会重定向到404页面，也就做到了全局404显示