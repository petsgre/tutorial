# 笔记


1. isArray 方法

> Object.prototype.toString.call([]) === '[object Array]'

2. 浏览器事件过程

 从最不具体元素 -------> 具体元素捕获
 从最具体元素(target) ---------> 最不具体元素冒泡