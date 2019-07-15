# 代理模式

代理顾名思义就是代替，或者理解为占位。

### 虚拟代理

e.g 图片预加载

```
// html
<img id='proxy' src="./loading.png" alt="">
```

```
// js
const img = new Image();
img.src = './entity.png'
img.onload = function() {
  document.getElementById('proxy').src = './entity.png'
};
```

通过loading图片代理真正的实体图片，当实体图片加在完毕之后再使用真正的src


### 缓存代理

缓存代理可以优化计算结果，可以提升代码的性能

```
function plus(a, b){
  return a + b
}

const cache = {}
function proxy (x, y){
  if([x,y].toString() in cache){
    return cache[[x,y].toString()]
  }else {
    return cache[[x,y].toString()] = plus(x, y)
  }
}
```
