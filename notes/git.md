# git common command

git status 

git diff

git commit -m 'xxx'

git pull

git pull --allow-unrelated-history 在已经创建的仓库拉去代码，合并本地已有的历史

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



- git merge 解决冲突 使用他人版本或者自己版本

   使用 参数 git checkout --ours <file>
   然后 git add
   或者
   使用 git checkout --theirs <file>;git add

- git merge --squash 合并分支的时候 合并commit

  这样就可以在开发的时候任意提交，然后在合并的时候重新提交一个总的commit就可以了

- git commit --date="Jan 6 10:10:10 2020 +0800"

   使用date参数，修改提交的时间，可以弥补之前忘记的提交

- git rebase -i dev

  在合并主线代码的时候使用rebase可以将自己分支的commit都排在主线分支之后

# Some Config

1. git中文乱码问题

> git config --global core.quotepath false

