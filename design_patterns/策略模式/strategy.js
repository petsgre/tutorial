// 相关的策略定义，一般是不可改变的
const strategy = {
  // 判断是否为空
  isNotEmpty(value, errorMsg) {
    if (value === '') {
      return errorMsg;
    }
  },
  // 判断手机号码格式是否符合
  mobileFormat(value, errorMsg) {
    if (!/(^1[3|5|8][0-9]{9}$)/.test(value)) {
      return errorMsg;
    }
  }
};
Object.freeze(strategy); // 算法部分一般不可改变

// 定一个检测器
var Validator = function() {
  // 检测器可以添加多个规则
  this.validateList = []
}
// 给检测器添加规则
Validator.prototype.add = function(node, rule) {
  var value = node.value || ''
  this.validateList.push(function() {
    return strategy[rule.rName](value, rule.errorMsg)
  })
}
// 开始检测
Validator.prototype.start = function() {
  for (let i = 0; i < this.validateList.length; i++) {
    let msg = this.validateList[i]()
    if (msg) {
      return msg
    }
  }
}
// new一个检测器
var v = new Validator()
v.add(document.getElementById('phone'), {
  rName: 'isNotEmpty',
  errorMsg: '邮箱不能为空'
})
v.add(document.getElementById('phone'), {
  rName: 'mobileFormat',
  errorMsg: '手机号码格式不对'
})
// 执行检测
if (v.start()) {
  console.log(v.start());
}
