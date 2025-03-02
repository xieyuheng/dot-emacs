;;;; mark and cruise

;; the follow functions are belong to lisp.el

;; (global-set-key (kbd "s-z") 'mark-defun)
;; (global-set-key (kbd "s-a") 'mark-sexp)
;;
;; (global-set-key (kbd "s-w") 'backward-sexp)
;; (global-set-key (kbd "s-s") 'forward-sexp)
;;
;; (defun down-list () (interactive) (down-list))
;; (global-set-key (kbd "s-e") 'down-list)
;;
;; (defun backward-up-list () (interactive) (backward-up-list))
;; (global-set-key (kbd "s-q") 'backward-up-list)
;;
;; (defun up-list () (interactive) (up-list))
;; (global-set-key (kbd "s-d") 'up-list)


;; (global-set-key (kbd "s-z") 'mark-defun)
(global-set-key (kbd "M-a") 'mark-sexp)

(global-set-key (kbd "M-e") 'backward-sexp)
(global-set-key (kbd "M-s") 'forward-sexp)

(defun down-list () (interactive) (down-list))
;; (global-set-key (kbd "M-e") 'down-list)

(defun backward-up-list () (interactive) (backward-up-list))
(global-set-key (kbd "M-q") 'backward-up-list)

(add-hook 'prog-mode-hook
          (lambda ()
            (local-set-key (kbd "M-q") 'backward-up-list)))

(defun up-list () (interactive) (up-list))
;; (global-set-key (kbd "s-d") 'up-list)


;; the following is for emacs-nox which can not see s-
(define-key input-decode-map [134217825] [M-a])
(global-set-key [M-a] 'mark-sexp)

;; (global-set-key (kbd "C-M-p") 'backward-sexp)
;; (global-set-key (kbd "C-M-n") 'forward-sexp)

;; (global-set-key (kbd "C-M-f") 'down-list)

;; (global-set-key (kbd "C-M-b") 'backward-up-list)


;;;; paredit

;; file:~/.emacs.d/edit-sexp/paredit.el

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code." t)

(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'racket-mode-hook           #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'shen-mode-hook             #'enable-paredit-mode)

;; the following is about the *scratch* buffer
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; 不知道为什么这里就算使用 maybe-map-paredit-newline 也总是绑定不到 RET
;; 只有在下面的 mode 中不使用 enable-paredit-mode
;; *scratch* buffer 中的 RET 才能正常
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)

;;;; mini-parentheses-editor

(global-set-key (kbd "M-(")         'paredit-wrap-round)
;; (global-set-key (kbd "M-{")         'paredit-wrap-round)
(global-set-key (kbd "C-M-9")       'paredit-wrap-round)
(global-set-key (kbd "M-c")         'paredit-splice-sexp)
(global-set-key (kbd "M-r")         'paredit-raise-sexp)

(global-set-key (kbd "<C-right>")   'paredit-forward-slurp-sexp)
(global-set-key (kbd "<C-left>")    'paredit-forward-barf-sexp)
(global-set-key (kbd "M-l")   'paredit-forward-slurp-sexp)
(global-set-key (kbd "M-h")    'paredit-forward-barf-sexp)

(global-set-key (kbd "M-\"")        'paredit-meta-doublequote)

(global-set-key (kbd "<C-M-right>") 'paredit-backward-barf-sexp)
(global-set-key (kbd "<C-M-left>")  'paredit-backward-slurp-sexp)
(global-set-key (kbd "C-M-l") 'paredit-backward-barf-sexp)
(global-set-key (kbd "C-M-h")  'paredit-backward-slurp-sexp)

;; (global-set-key (kbd "C-d")         'paredit-forward-delete)
;; (global-set-key (kbd "<backspace>") 'paredit-backward-delete)
;; (global-set-key (kbd "C-k")         'paredit-kill)
