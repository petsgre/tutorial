# 笔记


1. isArray 方法

> Object.prototype.toString.call([]) === '[object Array]'

2. 浏览器事件过程

 从最不具体元素 -------> 具体元素捕获
 从最具体元素(target) ---------> 最不具体元素冒泡

3. input file onchange事件在上传两种同样的名字文件时候不触发

```
// 使用dom将当前节点value改为null
inputDom.value = null;
```

4. 使用一些运算符将函数变为表达式

```
// 这样执行是报错的，无法解析js
function(){}()

// 添加一些运算符把函数转变为函数表达式
(function(){})()
!function(){}()
+function(){}()
~function(){}()
```

5. 逗号操作符

```
var a = 1;
var b = (a++,a); // 2
```

6. 子类 constructor 中调用 super() 其实就是调用父类的constructor函数

	如果父类constructor有参数，那么super(...agrs)也要添加参数

7. setTimeout 最小时间 

	计算机一般是 60Hz的频率，即 1秒钟 60次渲染  那么渲染一次的时间就是  1000/60  约等于 16.6
