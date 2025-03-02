(add-to-list 'load-path "~/.emacs.d/racket-mode/")
(require 'racket-mode)
(setq auto-mode-alist (cons `("\\.rkt$" . racket-mode) auto-mode-alist))
