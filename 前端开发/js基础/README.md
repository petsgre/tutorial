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