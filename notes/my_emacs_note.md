# emacs 个人笔记

1. C-x 0 关闭当前窗口

2. g 刷新当前 buffer

3. C-/ 撤销

4. C-g C-/ 反撤销

5. C-x C-j 打开当前文件名目录

6. M-x revert-buffer 刷新当前 buffer

7. C-d 打开当前 buffer 目录

8. C-M-\ 格式化代码

9. C-X C-F 如果当前打开目录的方式是 dired，无法创建新文件，会匹配到其他路径，这个时候继续 C-F 会进入 emacs 自带的文件模式，这个时候就可以创建新文件了

10. C-x h 全选

11. undo redo 都是用 command+z ，使用 C-g 切换

12. ubuntu undo redo 快捷键 ，不使用 command+z,而是用 C+\_

13. M-x ==> find-grep 在当前目录下全局搜索

14. dired 模式下 取消标记 d 标记删除 u 取消标记

15. dired 模式下 复制文件 使用大写 C 复制并命名

16. dired 模式下 重命名文件 使用大写 R 重新命名

17. 在目录列表 C-x C-q 进入编辑模式;重新输入文件或者文件名，C-x C-s 保存 即可

18. 注释： M-;

19. M-% 替换 输入搜索的字符，再输入要替换的字符，然后一个一个输入 y 代表替换

20. C-c C-f web-mode 下折叠标签

21. C-c C-n web-mode 定位到标签

22. magit 查看当前行 log magit-blame 参数选 b

23. make-directory 创建文件夹，如果出现同名的 C-x C-f 即可确定，不会被补全干扰 

24. 全局替换
    1. C-c j git全局查找
    2. C-c C-o 调出 occur
    3. C-x C-q 进入编辑模式
    4. 编辑完保存退出

25. term下如何删除 backspace
    使用 fn + backspace 删除文本


26. 很好用
    C-u C-c k 在指定目录搜索

27. C-h b
    显示快捷键解释

28. C-h m 查看当前buffer mode
