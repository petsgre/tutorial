// 冒泡排序 （Bubble Sort）


//原理 比较相邻的元素，俩俩比较，将小的往前边排。也是我们常见的嵌套循环


// 时间复杂度

// 执行次数  T(n) = 0.5n^2 - 0.5n   (最高执行次数)
//
// 保留函数 T(n)中的最高阶，省略系数
//
// 则  时间复杂度为   O(n^2)


// js 代码

let array = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

for (var i = 0; i < array.length - 1; i++) {
  for (var j = 0; j < array.length - i - 1; j++) {
     // 通过第一轮比较，把10放到了数组最后面，数组变成了[9, 8, 7, 6, 5, 4, 3, 2, 1, 10]
     // 再比较数组的前9项，再把9放到数组倒数第二位，数组变成了[8, 7, 6, 5, 4, 3, 2, 1, 9, 10]
     // ...
    if (array[j] > array[j + 1]) {
      var temp
      temp = array[j];
      array[j] = array[j + 1];
      array[j + 1] = temp;
    }
    console.log(array[j], array);
  }
  console.log("***");
}
console.log(array);
