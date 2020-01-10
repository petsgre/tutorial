# **this 指向规则**:

1. 如果使用new 关键字，this指向新new出来的对象本身

```
function Entity () {
this.name = 'xxx';
console.log(this)
}
var en = new Entity();
// {name:'xxx'}

```


2. 使用call，apply，bind ，this指向传入的对象


```
var obj = {name:'xxx'}
function fn(){
  console.log(this)
}
fn.call(obj)
// {name:'xxx'}
```


3. 如果function被一个对象引用并调用,则指向这个对象

```
function fn() {
  console.log(this);
}
var obj = {
  name: 'xxx',
  fn: fn
}
obj.fn()
//{name: "xxx", fn: ƒ}
```


4. 如果上面的都没有满足，则指向全局，严格模式下为 undefined
5. 如果符合多个规则，则按照1-3优先级

```
function fn() {
  console.log(this);
}
var obj = {
  name: 'xxx',
  fn: fn
}
var bar = { name: 'yyy' }
obj.fn.call(bar)
```

6. 如果是箭头函数，那么指向创建时的执行上下文（即当前代码块this指向）
