# bind,call,apply区别

从用法上，call和apply是一组，bind是一组

## 区别

call和apply同样是改变了this的指向，并且执行了函数
```
function bar() {
  this.invoke = function() {
    console.log(this);
  }
}
const b = new bar()
b.invoke() // bar
b.invoke.call(this) //windows
bar()
```

bind 只是bind了this，但是并不执行，他返回的是一个修改了上下文this的一个函数,需要再()来执行函数

```
function bar() {
  this.invoke = function() {
    console.log(this);
  }
}
const b = new bar()
b.invoke.bind(this)() //windows
```


## call和apply

作用一模一样，不同之处在于参数

```
function bar() {
  this.invoke = function(arg1, arg2) {
    console.log(this);
    console.log(arg1);
    console.log(arg2);
  }
}
const b = new bar()
b.invoke.call(this, 1, 2)
b.invoke.apply(this, [1, 2])
```


## 利用call实现继承

```
function Foo(name){      
    this.name = name;      
}      

function Bar(name){    
    Foo.call(this, name);    
}
const b = new Bar('bar')
console.log(b.name) // bar
```

Foo.call(this, name); 就是this指向Foo，即现在使用this，相当于就是在调用Foo

所以即便Bar没有定义name，也会有name属性。
