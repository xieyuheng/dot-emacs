;;;; title

(setq frame-title-format
      '(:eval (or (buffer-file-name) (buffer-name))))

;;;; no distraction

(mouse-avoidance-mode 'animate)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)

;;;; line height

(setq-default line-spacing 0.15)

;;;; misc

(setq tab-width 8)
(setq visible-bell t)
(setq column-number-mode t)
(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq kill-buffer-query-functions nil)
(setq-default indent-tabs-mode nil)
(setq case-fold-search nil)
(setq case-replace t)
(setq scroll-margin 7)
(setq scroll-conservatively 10000)
(transient-mark-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;;; enable disabled features

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;;;; disable backup

(setq make-backup-files nil)
(setq delete-old-versions t)

(setq auto-save-default nil)
(setq auto-save-timeout 100000000000000)

(setq create-lockfiles nil)

;;;; input method

(setq x-gtk-use-native-input t)

;;;; fix frame-alist

(defvar my-frame-alist
  '((fullscreen . maximized)
    (vertical-scroll-bars . nil)))

(setq default-frame-alist my-frame-alist)
(setq initial-frame-alist my-frame-alist)

;;;; cursor

(blink-cursor-mode -1)
(set-frame-parameter nil 'cursor-type 'box)

;;;; improve fullscreen

(setq frame-resize-pixelwise t)

;;;; watch file change and update buffer

(global-auto-revert-mode t)
(setq auto-revert-interval 0.3)

;;;; to edit rectangles

(cua-selection-mode 1)

;;;; buffer name

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;;; minibuffer

(setq enable-recursive-minibuffers nil)
(add-hook 'minibuffer-setup-hook (lambda () (setq truncate-lines t)))
(setq resize-mini-windows nil)
(setq max-mini-window-height 1)
