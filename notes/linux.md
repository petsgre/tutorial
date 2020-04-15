# 文章

1. [图解SSH原理](https://www.jianshu.com/p/33461b619d53)

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

3. 修改文件夹名称

```
mv xxx yyy
```
> 修改文件名：mv xxx.js xxx.md


4. 传输文件

```
scp /zx/project/xxx.js root@11.11.11.11:/home/project/
```

5. 查看nginx状态
systemctl status nginx.service

6.查看端口状态

netstat -ap

7. nginx 配置history模式

```
location / {
  try_files $uri $uri/ /index.html;
}
```

8. 查看系统是32位还是64位

> sudo uname -m

9. 查看端口占用

>  lsof -i tcp:9000
>  kill pid
>  kill -9 强制执行
>  kill -1 等同于 control+c

10. 使用more分页查看命令行内容

> xxx command | more

11. 打开docker查看目录

> docker exec -it containerID /bin/bash

12. ssh copy id

```
ssh-copy-id -i .ssh/id_rsa.pub -p 22 root@1.1.1.1
```

13. 查看进程，杀死进程

```
ps -ef | grep trojan  第二项是 PID
kill -9 PID
```

14. terminal切换到zsh

```
zsh --version
chsh -s /bin/zsh
```
