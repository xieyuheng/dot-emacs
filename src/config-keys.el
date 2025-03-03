;;;; hippie-expand

(global-set-key (kbd "C-h") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-file-name-partially
        try-complete-file-name
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;;;; change-parentheses

(add-to-list 'load-path "~/.emacs.d/change-parentheses/")
(require 'change-parentheses)
(global-set-key (kbd "M-[") 'change-parentheses)

;;;; x-clipboard-yank

(defun x-clipboard-yank ()
  (interactive)
  (insert (eshell-command-result "xclip -o")))

(global-set-key (kbd "C-M-y") 'x-clipboard-yank)

;;;; <C-f1> <C-f2>

(defun my-<C-f1> () (interactive) (forward-word) (delete-char 1) (insert "-"))
(defun my-<C-f2> () (interactive) (forward-word) (delete-char 1) (insert "_"))

(global-set-key (kbd "<C-f1>") 'my-<C-f1>)
(global-set-key (kbd "<C-f2>") 'my-<C-f2>)

;;;; unbind

(global-set-key (kbd "M-t") 'nil) ;; default 'transpose-words
(global-set-key (kbd "M-j") 'nil)
(global-set-key (kbd "M-k") 'nil)
(global-set-key (kbd "M-`") 'nil)

;;;; prefix-command

(define-prefix-command 'C-s-map)
(global-set-key (kbd "C-s") 'C-s-map)
;; "C-s C-s" : edit-indirect-commit
;; "C-s C-e" : switch-to-eshell

;;;; cruise

(defun window-> () (interactive) (other-window +1))
(defun <-window () (interactive) (other-window -1))

(global-set-key (kbd "C-o") 'window->)

(global-set-key (kbd "M-=") 'window->)
(global-set-key (kbd "M--") '<-window)

(global-set-key (kbd "C-x .") 'next-buffer)
(global-set-key (kbd "C-x ,") 'previous-buffer)

(global-set-key (kbd "C-M-.") 'next-buffer)
(global-set-key (kbd "C-M-,") 'previous-buffer)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;;;; window resizing

(global-set-key (kbd "C-M-h") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-l") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-j") 'shrink-window)
(global-set-key (kbd "C-M-k") 'enlarge-window)

;;;; line wrap

;; (global-set-key (kbd "C-M-g") 'global-visual-line-mode)
(global-set-key (kbd "C-M-g") 'toggle-truncate-lines)

;;;; comment

(global-set-key (kbd "C-.") 'comment-region)
(global-set-key (kbd "C-,") 'uncomment-region)
(global-set-key (kbd "M-;") 'comment-dwim)

;;;; edit

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x <backspace>") 'delete-backward-char)
(global-set-key (kbd "C-x C-h") 'mark-whole-buffer)
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;;;; view

(defun scroll-right-as-my-wish () (interactive) (scroll-left -1 1))
(defun scroll-left-as-my-wish () (interactive) (scroll-left 1 1))

(global-set-key (kbd "<prior>") 'scroll-right-as-my-wish)
(global-set-key (kbd "<next>") 'scroll-left-as-my-wish)

(setq hscroll-step 1)
(setq hscroll-margin 6)

;;;; query-replace

(setq case-fold-search nil)
(global-set-key (kbd "M-i") 'query-replace)
(global-set-key (kbd "<C-M-i>") 'replace-string)

;;;; whitespace

(global-set-key (kbd "C-M-w")
                (lambda ()
                  (interactive)
                  (message "* (whitespace-cleanup)")
                  (whitespace-cleanup)))

;; only show bad whitespace
(setq whitespace-style
      '(trailing space-before-tab indentation empty space-after-tab))

(whitespace-mode t)
(global-whitespace-mode t)

;;;; save-buffer

(global-set-key (kbd "C-x C-s") (lambda () (interactive) (save-buffer) (redraw-display)))
(global-set-key (kbd "C-s C-x") (lambda () (interactive) (save-buffer) (redraw-display)))

;;;; mouse

(dolist (k '([mouse-1] [down-mouse-1] [M-down-mouse-1] [C-down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1] [M-drag-mouse-1]
             [mouse-2] [down-mouse-2] [M-down-mouse-2] [C-down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2] [M-drag-mouse-2]
             [mouse-3] [down-mouse-3] [M-down-mouse-3] [C-down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3] [M-drag-mouse-3]
             [mouse-4] [down-mouse-4] [M-down-mouse-4] [C-down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4] [M-drag-mouse-4]
             [mouse-5] [down-mouse-5] [M-down-mouse-5] [C-down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5] [M-drag-mouse-5]
             [mouse-6] [down-mouse-6] [M-down-mouse-6] [C-down-mouse-6] [drag-mouse-6] [double-mouse-6] [triple-mouse-6] [M-drag-mouse-6]
             [mouse-7] [down-mouse-7] [M-down-mouse-7] [C-down-mouse-7] [drag-mouse-7] [double-mouse-7] [triple-mouse-7] [M-drag-mouse-7]))
  (global-set-key k (lambda () (interactive))))

;;;; search

(global-set-key (kbd "C-t") 'isearch-forward)

(add-hook
 'isearch-mode-hook
 (lambda ()
   (define-key isearch-mode-map (kbd "C-t") 'isearch-repeat-forward)))
