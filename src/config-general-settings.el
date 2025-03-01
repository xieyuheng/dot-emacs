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
