(add-to-list 'load-path "~/.emacs.d/racket-mode/")
(require 'racket-mode)
(setq auto-mode-alist (cons `("\\.rkt$" . racket-mode) auto-mode-alist))

(define-key racket-mode-map (kbd "C-M-y") nil)
