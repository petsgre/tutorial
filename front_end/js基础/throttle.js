// 节流的实现原理

function throttle(fn, delay) {
  let timer
  return function () {
    if (timer) {
      return
    }

    timer = setTimeout(() => {
      fn()
      timer = null
    }, delay)
  }
}
function changeColor() {
  const color = `rgb(${Math.floor(Math.random() * 255)},${Math.floor(
    Math.random() * 255
  )},${Math.floor(Math.random() * 255)})`

        document.body.style.background = color
}
const resizeFun = throttle(changeColor, 1000)

window.addEventListener("resize", resizeFun)
