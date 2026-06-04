;;;; prefix-command

(global-set-key (kbd "C-s") (make-sparse-keymap))

;;;; clone-frame

(global-set-key (kbd "C-s C-c") 'clone-frame)
(global-set-key (kbd "C-s C-w") 'x-sidebar)
(global-set-key (kbd "C-x C-c") 'x-delete-frame-or-exit)

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

(global-set-key (kbd "M-[") 'x-cycle-brackets)

;;;; x-paste-from-clipboard

(global-set-key (kbd "C-M-y") 'x-paste-from-clipboard)

(global-set-key (kbd "C-M-u") 'fill-region)

;;;; <C-f1> <C-f2>

(global-set-key (kbd "<C-f1>") 'x-convert-to-kebab)
(global-set-key (kbd "<C-f2>") 'x-convert-to-snake)

;;;; unbind

(global-set-key (kbd "M-t") 'nil) ;; default 'transpose-words
(global-set-key (kbd "M-j") 'nil)
(global-set-key (kbd "M-k") 'nil)
(global-set-key (kbd "M-`") 'nil)

;;;; cruise

(global-set-key (kbd "C-o") (lambda () (interactive) (other-window +1)))

(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)

(global-set-key (kbd "C-s .") 'next-buffer)
(global-set-key (kbd "C-s ,") 'previous-buffer)

(global-set-key (kbd "C-M-.") 'next-buffer)
(global-set-key (kbd "C-M-,") 'previous-buffer)

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;;;; line wrap

(global-set-key (kbd "C-M-g") 'toggle-truncate-lines)

;;;; comment

(global-set-key (kbd "C-;") 'x-toggle-comment)

;;;; edit

(global-set-key (kbd "C-x C-h") 'mark-whole-buffer)
(global-set-key (kbd "C-x k") 'x-kill-current-buffer)

;;;; view

(global-set-key (kbd "<prior>") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "<next>") (lambda () (interactive) (scroll-up 1)))

(setq hscroll-step 1)
(setq hscroll-margin 6)

;;;; query-replace

(setq case-fold-search nil)
(global-set-key (kbd "M-i") 'query-replace)
;; (global-set-key (kbd "<C-M-i>") 'replace-string)

;;;; whitespace

(global-set-key (kbd "C-M-w")
                (lambda ()
                  (interactive)
                  (message "* (whitespace-cleanup)")
                  (whitespace-cleanup)))

;;;; save-buffer

(global-set-key (kbd "C-x C-s") 'x-save-buffer)
(global-set-key (kbd "C-s C-x") 'x-save-buffer)

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

(global-set-key (kbd "C-r") 'swiper)
(define-key swiper-map (kbd "C-r") 'swiper-C-s)

(global-set-key (kbd "C-t") 'counsel-git)
(global-set-key (kbd "C-x C-f") 'counsel-git)
(global-set-key (kbd "C-x f") 'counsel-git-grep)

;;;;; jump-to-file

(global-set-key (kbd "C-s C-j") 'x-jump-to-file)
