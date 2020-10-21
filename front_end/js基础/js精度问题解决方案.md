```
function toInt(float) {
  return parseInt(float.toFixed(2).toString().replace('.', ''))
}

function add(a, b) {
  return (toInt(a) + toInt(b)) / 100
}
add(0.1, 0.2) // 0.3
```


直接用js计算浮点型，会出现精度问题

这里采用先放大成整数在计算，这样就可以避免精度丢失的问题
