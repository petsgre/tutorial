## js
1. [JS实现继承的几种方式](https://www.cnblogs.com/humin/p/4556820.html)
2. [JS的防抖与节流](https://mp.weixin.qq.com/s/Vkshf-nEDwo2ODUJhxgzVA)/[demo](./js基础/throttle.js)
3. [原型链继承](./js基础/原型链继承.md)
4. [js利用offsetWidth和clientWidth来计算滚动条的宽度](https://www.haorooms.com/post/js_scroll_width)
5. [defer和async](https://juejin.im/entry/5a7ad55ef265da4e81238da9) 看到结论笑出了声，哈哈
6. [Mock.js的正确使用以及丢失cookie的问题](https://zhuanlan.zhihu.com/p/63761370)
7. [require和import的区别](https://blog.csdn.net/qq_28702545/article/details/54892562)
8. [函数柯里化](./js基础/cuury.js) // 实用的编程技巧
9. [微任务、宏任务与Event-Loop](https://juejin.im/post/5b73d7a6518825610072b42b)
10. [全面解析Vue.nextTick实现原理](https://juejin.im/entry/5aced80b518825482e39441e)
11. [js错误隔离](http://taobaofed.org/blog/2016/11/10/prevent-prop-access-error-in-js/)
12. [JavaScript浮点数运算的精度问题](https://www.html.cn/archives/7340)
13. [js精度问题解决方案](./js基础/js精度问题解决方案.md)
14. [图片预加载模糊处理](http://www.fly63.com/article/detial/359)
15. [原生 JS+CSS 实现 Material Design 点击效果](https://juejin.im/entry/59434da48d6d810058cf484a)
16. [js类型转换总结](待总结)

## css

1. [为什么不建议使用*{padding:0;margin:0;}进行reset](https://blog.csdn.net/lewky_liu/article/details/79982085)
2. [flex设置一行文字居中，两行或者多行同样居中](https://blog.csdn.net/viaChanging/article/details/79387130)
3. [font-size: 62.5%;的由来](./css/font-size: 62.5%;的由来)
4. [子元素的margin-top属性传递给父元素的问题](https://blog.csdn.net/liuyan19891230/article/details/52515357)
5. [fontsize0解决空白间隙问题](https://blog.csdn.net/github_38771368/article/details/73549381)
6. [css-grid布局](http://www.ruanyifeng.com/blog/2019/03/grid-layout-tutorial.html)
7. [css实现多边形](https://segmentfault.com/a/1190000019013585)

## html

1. [vscode use emmet by default](https://medium.com/@eshwaren/enable-emmet-support-for-jsx-in-visual-studio-code-react-f1f5dfe8809c)




# Notes

1. 401:没有带权限标志；403:带了权限标志，但是权限不足

2. 为什么form表单可以跨域，其实本质上http请求都是可以跨域的，只是浏览器对ajax做了限制，使得返回的数据js无法读取，而表单提交，不会返回数据，并且默认行为会刷新到action的url，所以浏览器就不会对他做限制