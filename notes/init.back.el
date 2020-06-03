(require 'package)
;; 添加melpa资源
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(tool-bar-mode -1)


(delete-selection-mode 1)
(delete-selection-mode nil)

(setq-default cursor-type 'bar)

(use-package multiple-cursors
  :ensure t)

(use-package awesome-pair
  :ensure t)

(global-set-key (kbd "s-d") 'mc/mark-next-like-this)

;; 进入全屏
(defun fullscreen ()
      (interactive)
      (set-frame-parameter nil 'fullscreen
                           (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "<s-return>") 'fullscreen)

;; 使用use-package下载一些包
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 将询问语改成 y和n简写
;;(fset yes-or-no-p 'y-or-n-p)

;; 显示行号
(global-linum-mode 1)
(setq linum-format "%d:")

;; 使用f5刷新
(global-set-key (kbd "<f5>") 'revert-buffer)


;; (global-set-key (kbd "<s-up>") 'shrink-window)
;; (global-set-key (kbd "<s-down>") 'enlarge-window)
;; (global-set-key (kbd "C-x =") 'shrink-window-horizontally)
;; (global-set-key (kbd "C-x -") 'enlarge-window-horizontally)

;; try可以临时使用这个包，再次重启emacs会删除掉使用try安装的包
(use-package try
  :ensure t)

;; (use-package iedit
;;   :ensure t
;;   :config
;;   ((global-set-key "\C-;" 'iedit-mode)))

(use-package iedit
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


(use-package counsel
  :ensure t
  )
;; 使用swiper在底部显示待选项，可以用 C n C p快速切换
(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))
;; 自动完成
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package zenburn-theme
  :ensure t
  :config (load-theme 'zenburn t))
;; 设置字体格式 describe-font 获取描述文件
(set-default-font "-*-Monaco-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")

;; 添加redo undo 树
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

;; 设置打开新窗口默认在右边
(setq
 split-width-threshold 0
 split-height-threshold nil)

;; 选择括号中间的内容
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "s-=") 'er/expand-region))


;; 添加跳转到定义
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)

;; 设置项目
;; (use-package projectile
;;   :ensure t
;;   :config
;;   (projectile-global-mode)
;;   (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;   (projectile-mode +1)
;;   (setq projectile-mode-line
;;         '(:eval (format " [%s]" (projectile-project-name))))
;;   (setq projectile-remember-window-configs t)
;;   (setq projectile-completion-system 'ivy))

;; projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy))

;; (use-package counsel-projectile
;; :ensure t
;; :config
;; (counsel-projectile-mode))

(global-set-key (kbd "C-x C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "<s-backspace>") 'kill-whole-line)

;; 上下移动选中的区域或者行
(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key [\M-\S-up] 'move-text-up)
(global-set-key [\M-\S-down] 'move-text-down)

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
	  (funcall (cdr my-pair)))))
(defun my/web-vue-setup()
  "Setup for js related."
  (message "web-mode use vue related setup")
  (setup-tide-mode)
  (emmet-mode)
  (prettier-js-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-select-checker 'javascript-eslint)
  (my/use-eslint-from-node-modules)
  (add-to-list (make-local-variable 'company-backends)
               '(comany-tide company-web-html company-css company-files))
  )

(defun my/use-eslint-from-node-modules ()
  "Use local eslint from node_modules before global."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(require 'prettier-js)

(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :hook
  (sgml-mode . emmet-mode)
  (web-mode  . emmet-mode)
  (css-mode  . emmet-mode))

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" "\\.vue\\'")
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
  (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")
  (setq web-mode-content-types-alist
        '(("vue" . "\\.vue\\'")))
  ;; (use-package company-web
  ;;   :ensure t)
  ;; (add-hook 'web-mode-hook (lambda()
  ;;                            (cond ((equal web-mode-content-type "html")
  ;;                                   (my/web-html-setup))
  ;;                                  ((member web-mode-content-type '("vue"))
  ;;                                   (my/web-vue-setup))
  ;;                                  )))
  )


(use-package magit ; TODO key bindings and such
  :ensure t)

(use-package lsp-mode
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

