# 生成 n-m 的随机数 (m>n)

Math.random()*(m-n) + n

因为 m-n 为两个数的差值， 而 Math.random()为 0-1 的浮点数。

所以他们的乘积 ‘Math.random()*(m-n)’ 永远不会大于差值

eg 生成 5-36 之间的随机数

36 - 5 = 31;
31 乘以 0-1 的任何数都不会超过 31
再加上 最小值 5 ，这样总和就不会超过 36
