function debounce(fn, delay) {
  let timer
  return function () {
    clearTimeout(timer)
    timer = setTimeout(() => {
      fn.call(this, ...arguments)
    }, delay)
  }
}

function invoke(e) {
  console.log(e)
  console.log(this)
}

const fun = debounce(invoke, 1000)

const div = document.querySelector("div")
div.addEventListener("click", fun)
