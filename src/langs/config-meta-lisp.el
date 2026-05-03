(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/modes")
(require 'meta-lisp)

(setq auto-mode-alist (cons `("\\.meta$" . meta-lisp-mode) auto-mode-alist))
