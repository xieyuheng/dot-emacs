(add-to-list 'load-path "~/.emacs.d/go-mode/")
(require 'go-mode)

(add-hook
 'go-mode-hook
 (lambda ()
   (setq tab-width 4)
   (setq indent-tabs-mode nil)))
