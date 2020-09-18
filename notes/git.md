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


- git 删除远端分支

  git branch -r -d origin/xxx
  git push origin :xxx


- git 创建远端分支

git checkout -b xxx
git push origin xxx
git branch --set-upstream.....

- git revert到已经merge之前的代码(拯救已经merge的错误)

git revert -m 1 <merge时候的commit版本号>

- git add 到暂存区 reset 后恢复文件

    1. 执行 git fsck --lost-found
       然后在 .git/lost-found 目录里面找回丢失的文件
    2. find .git/objects -type f  这里记录了之前的 ~add~ 操作的记录
       eg:
       ```
           .git/objects/00/8b61d60cc4829d438e54a4073f2fdd4b62ae74
           .git/objects/f8/b87f2108add14628c664ca467d440b5b99616f
           .git/objects/d5/0d6c1c2e8494ef1fa61404325b90d8a0f32423
           .git/objects/10/8a0a5571dd613691ab0af4c3c4fc691b7e2e06
       ```
       然后 git cat-file -p 008b61d60cc4829d438e54a4073f2fdd4b62ae74
       在终端复制出丢失的文本
