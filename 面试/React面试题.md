# React面试题

1. 虚拟DOM的好处
   - 减少DOM操作，更新更加迅速
   - 转义防止XSS
   - 跨平台
2. 合成事件
   - 绑定在root节点上
   - 分别添加了捕获和冒泡的事件，所以看起来更正确
3. Diff算法
   - 调和阶段begin
   - 单节点和多节点
4. this.setState是同步还是异步
   - 事件触发后先添加一个异步回调（performUnitOfWork），然后再处理queue
   - 加入update queue 使用BatchedContext做标记，queue是个环列表，process update queue的时候再把环解开
   - 因为setTimeout时候 BatchedContext被修改，所以是同步，其余是异步，还可以用batchUpdate方法做回调来异步调用
5. 