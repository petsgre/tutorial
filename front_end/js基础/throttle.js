// 节流的实现原理

function throttle(fn, wait) {
  var time = null;
  var counter = null
  return function() {
    if (time == null) {
      time = 1
      fn()
      counter = setTimeout(function(){
        time = null
      },wait)
    } else {
      return
    }
  }
}
