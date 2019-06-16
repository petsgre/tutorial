// 模拟定义当前环境为 production
const env = 'production'
let baseUrl = ''

// 一般逻辑的代码，每次执行相应的代码需要判断当前环境是什么
if (env == 'production') {
  console.log('当前环境：production');
  baseUrl = 'pro'
} else {
  console.log('当前环境：非production');
  baseUrl = 'notpro'
}

// 使用函数柯里化，只需要第一次判断环境，之后都直接执行具体逻辑代码
function curry(env) {
  function isProEnv() {
    return env == 'production'
  }
  let envName = ''
  if (isProEnv()) {
    envName = '当前环境：production'
  } else {
    envName = '当前环境：非production'
  }
  return function() {
    return envName
  }
}
const sayEnvName = curry(env)
console.log(sayEnvName());
// 当再次需要获取当前环境的时候，执行sayEnvName即可，不需要再判断 env
// 再次调用
console.log(sayEnvName());
