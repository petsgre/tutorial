(require 'package)
;; 添加melpa资源
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;; 使用use-package下载一些包
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; try可以临时使用这个包，再次重启emacs会删除掉使用try安装的包
(use-package try
  :ensure t)
;; 使用which key 在输入 C-x时会有命令提示
(use-package which-key
  :ensure t
  :config (which-key-mode))
;; 下面这三段式让buffer在下面可以使用tab切换出来
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;(defalias 'list-buffers' ibuffer)
;; 在当前窗口显示buffer list
(global-set-key (kbd "C-x C-b") 'ibuffer)
