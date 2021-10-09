class Promise {
  static PENDING = "pending" // 设置常量
  constructor(executor) {
    this.status = Promise.PENDING
    this.value = null
    // this.resolve = this.resolve.bind(this)
    this.reject = this.reject.bind(this)
    this.then = this.then.bind(this)
    this.resolveCallbacks = []
    this.rejectCallbacks = []
    if (typeof executor === "function") {
      try {
        executor(this.resolve, this.reject)
      } catch (e) {
        this.reject(e)
      }
    }
  }
  // 如果使用箭头函数，this就指向当前这级，即Promise这个类这一级
  resolve = (value) => {
    if (this.status === "pending") {
      this.status = "fulfilled"
      this.value = value
      this.resolveCallbacks.forEach((cb) => {
        cb(this.value)
      })
    }
  }
  // 如果直接使用函数，就类似function bar(){}一样，this的指向需要再bind,
  // 此时class内默认是严格模式this为undefined
  reject(reason) {
    if (this.status === "pending") {
      this.status = "rejected"
      this.reason = reason
      this.rejectCallbacks.forEach((cb) => {
        cb(this.reason)
      })
    }
  }
  then(onFulfilled = () => {}, onRejected = () => {}) {
    return new Promise((resolve, reject) => {// 返回一个新的Promise实现链式调用
      // 这里是精髓
      // 如果有延迟操作，先把要执行的then保存起来，等resolve执行时候在运行then函数
      if (this.status === "pending") {
        this.resolveCallbacks.push(() => {
          queueMicrotask(() => {
            const x = onFulfilled(this.value)
            resolve(x)
          })
        })
        this.rejectCallbacks.push(() => {
          queueMicrotask(() => {
            const x = onRejected(this.reason)
            resolve(x)
          })
        })
      }
      if (this.status === "fulfilled") {
        queueMicrotask(() => {
          const x = onFulfilled(this.value)
          resolve(x)
        })
      }
      if (this.status === "rejected") {
        queueMicrotask(() => {
          const x = onRejected(this.reason)
          resolve(x)
        })
      }
    })
  }
}

export default Promise
