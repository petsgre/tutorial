# 单例模式

单例就是保证一个类只有一个实例，实现的方法一般是先判断实例存在与否，如果存在直接返回，如果不存在就创建了再返回，这就确保了一个类只有一个实例对象。

	const instance = function (fn) {
      let _instance
      return function (param) {
        return _instance || (_instance = fn())
      }
    }
    const createNode = function () {
      let node = document.createElement('div')
      document.body.appendChild(node)
      node.innerHTML = '新节点'
      return node
    }
    const initDiv = instance(createNode)
    let instance1 = initDiv(1)
    let instance2 = initDiv(2)
    console.log(instance1 == instance2);