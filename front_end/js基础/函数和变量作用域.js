var a = 1;

function b() {
  a = 10;
  return;

  function a() {
    console.log(a);
  }
}
b(); // 执行函数b中的a指向的是内部方法 function a  ,即把 function a 赋值给10
//函数预解析，优先于变量
console.log(a); //此时的全局a并没有被赋值，还是1


//-----------
console.log(c)// 函数预解析
c();// 执行函数
var c = 3;

function c() {
  console.log(10)
}
console.log(c) // 此时全局中有变量c 变量赋值会覆盖函数‘赋值’，所以c指向3
c = 6;
c();

//----------
var d;
console.log(d); // d未赋值，js会寻找函数function d()

function d() {
  console.log(10);
}


//-----------
//结论
// 1. 变量赋值没有函数赋值优先级高，如果同时声明变量并赋值，他是在函数之后的 即 a = 1 发生在 function a(){}之后
// 2. 函数会预解析，所以可以在声明前就调用
// 3. js执行顺序自上而下，作用域变量查找是又内向外的，如果内部找到变量，不管他是函数还是varibale都停止往外寻找
