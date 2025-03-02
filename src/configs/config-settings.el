;;;; line height

(setq-default line-spacing 0.15)
;; (setq-default line-spacing 0)

;;;; title

(setq frame-title-format "%b")

;;;; variable

(setq kill-buffer-query-functions nil)
(setq tab-width 2)
(setq visible-bell t)

(setq case-fold-search nil)
(setq case-replace t)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
;; 全局设置上面的变量并没有用
(add-hook 'prog-mode-hook (lambda () (setq indent-tabs-mode nil)))

(fringe-mode '(6 . 6))
(transient-mark-mode t)
(setq column-number-mode t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq enable-recursive-minibuffers nil)
(add-hook 'minibuffer-setup-hook (lambda () (setq truncate-lines t)))
;; (setq scroll-margin 4)
(setq scroll-margin 7)
(setq scroll-conservatively 10000)
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;;; enable disable

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;; disable backup

(setq make-backup-files nil)
(setq delete-old-versions t)

(setq auto-save-default nil)
(setq auto-save-timeout 100000000000000)

;;;; dired

(add-hook 'dired-mode-hook
          (lambda ()
            (local-set-key (kbd "C-n") 'ranger-next-file)
            (local-set-key (kbd "C-p") 'ranger-prev-file)))

;;;; input-method

(setq x-gtk-use-native-input t)

;;;; window

(setq default-frame-alist '((fullscreen . maximized)))
(setq initial-frame-alist '((fullscreen . maximized)))

;;;; 免打扰

(mouse-avoidance-mode 'animate)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;;;; 光标

(blink-cursor-mode -1)

;; (set-frame-parameter nil 'cursor-type 'hollow)
(set-frame-parameter nil 'cursor-type 'box)
;; (set-frame-parameter nil 'cursor-type 'bar)
;; (set-frame-parameter nil 'cursor-type '(bar . 2))
;; (set-frame-parameter nil 'cursor-type 'hbar)
;; (set-frame-parameter nil 'cursor-type '(hbar . 8))

;;;; 修复 fullscreen 效果

(setq frame-resize-pixelwise t)

;;;; watch file change and update buffer

(global-auto-revert-mode t)
(setq auto-revert-interval 0.3)

;;;; gc-cons-threshold

;; default 800000 -- 0.76 MB
;; (setq gc-cons-threshold 800000)

;;;; cua-selection-mode

(cua-selection-mode 1)

;;;; uniquify

(require 'uniquify)
;; (setq uniquify-buffer-name-style 'reverse)
(setq uniquify-buffer-name-style 'forward)
