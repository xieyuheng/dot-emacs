;;;; mark and cruise

;; the follow functions are belong to lisp.el

(global-set-key (kbd "M-a") 'mark-sexp)
(global-set-key (kbd "M-e") 'backward-sexp)
(global-set-key (kbd "M-s") 'forward-sexp)
(global-set-key (kbd "M-q") 'backward-up-list)
(add-hook 'prog-mode-hook
          (lambda () (local-set-key (kbd "M-q") 'backward-up-list)))

;;;; paredit

(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)
(paredit-mode +1)

(add-hook 'scheme-mode-hook      'enable-paredit-mode)
(add-hook 'racket-mode-hook      'enable-paredit-mode)
(add-hook 'lisp-mode-hook        'enable-paredit-mode)
(add-hook 'shen-mode-hook        'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook  'enable-paredit-mode)

;;;; mini-parentheses-editor

(global-set-key (kbd "M-(")          'paredit-wrap-round)
(global-set-key (kbd "C-M-9")        'paredit-wrap-round)
(global-set-key (kbd "M-c")          'paredit-splice-sexp)
(global-set-key (kbd "M-r")          'paredit-raise-sexp)
(global-set-key (kbd "<C-right>")    'paredit-forward-slurp-sexp)
(global-set-key (kbd "<C-left>")     'paredit-forward-barf-sexp)
(global-set-key (kbd "M-l")          'paredit-forward-slurp-sexp)
(global-set-key (kbd "M-h")          'paredit-forward-barf-sexp)
(global-set-key (kbd "M-\"")         'paredit-meta-doublequote)
(global-set-key (kbd "<C-M-right>")  'paredit-backward-barf-sexp)
(global-set-key (kbd "<C-M-left>")   'paredit-backward-slurp-sexp)
(global-set-key (kbd "C-M-l")        'paredit-backward-barf-sexp)
(global-set-key (kbd "C-M-h")        'paredit-backward-slurp-sexp)
