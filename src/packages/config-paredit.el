(add-to-list 'load-path "~/.emacs.d/paredit")
(require 'paredit)

;; do not insert space before (),
;; so that we can use paredit in c-mode.
;; for example f().
(defun my-space-for-delimiter-p (endp delimiter) nil)
(setq paredit-space-for-delimiter-predicates
      (list 'my-space-for-delimiter-p))

(add-hook 'prog-mode-hook        'enable-paredit-mode)
(add-hook 'markdown-mode-hook    'enable-paredit-mode)
(add-hook 'ranger-mode-hook      'enable-paredit-mode)

;; my usage of the keys

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-j") nil)
     (define-key paredit-mode-map (kbd "<RET>") nil)
     (define-key paredit-mode-map (kbd "C-M-u") nil)
     (define-key paredit-mode-map (kbd "C-M-d") nil)
     (define-key paredit-mode-map (kbd "C-M-p") nil)
     (define-key paredit-mode-map (kbd "C-M-n") nil)
     (define-key paredit-mode-map (kbd ";") nil)))

(define-key paredit-mode-map (kbd "C-M-9")        'paredit-wrap-round)
(define-key paredit-mode-map (kbd "M-c")          'paredit-splice-sexp)
(define-key paredit-mode-map (kbd "M-r")          'paredit-raise-sexp)
(define-key paredit-mode-map (kbd "<C-right>")    'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "<C-left>")     'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "M-\"")         'paredit-meta-doublequote)
(define-key paredit-mode-map (kbd "<C-M-right>")  'paredit-backward-barf-sexp)
(define-key paredit-mode-map (kbd "<C-M-left>")   'paredit-backward-slurp-sexp)

;; the follow functions are from lisp.el

(global-set-key (kbd "M-a") 'mark-sexp)
(global-set-key (kbd "M-e") 'backward-sexp)
(global-set-key (kbd "M-s") 'forward-sexp)
(global-set-key (kbd "M-q") 'backward-up-list)

(define-key paredit-mode-map (kbd "M-a") 'mark-sexp)
(define-key paredit-mode-map (kbd "M-e") 'backward-sexp)
(define-key paredit-mode-map (kbd "M-s") 'forward-sexp)
(define-key paredit-mode-map (kbd "M-q") 'backward-up-list)
