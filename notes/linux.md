# linux 命令笔记

1. 查询linux系统版本

```
lsb_release -a
```

2. 复制文件

```
cp -a demo/ target/
// 复制切不包含某些文件 使用 rsync命令
rsync -rv --exclude=.git demo/ target/

```