使用node运行shell脚本

1. vi xxx.sh
2. chmod a+x xxx.sh // 给sh可执行权限
3. node

```
const exc = require('child_process');

exc.execFile('./xxx.sh');

```