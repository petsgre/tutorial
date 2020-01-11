# git common command

git status 

git diff

git commit -m 'xxx'

git pull

git push

git log

git branch

git checkout xxx 

git merge xxx 

git stash

git checkout commit file  (检出某个提交的文件)

git mv

git remote set-url origin git@xxx

git show

git branch --set-upstream-to=origin/<local_branch> <origin_branch>


# some config

1. git中文乱码问题

> git config --global core.quotepath false


2. git merge 解决冲突 使用他人版本或者自己版本

   使用 参数 git checkout --ours <file>
   然后 git add
   或者
   使用 git checkout --theirs <file>;git add
   