(add-to-list 'load-path "~/.emacs.d/forth-mode/")

(require 'forth-mode)
(require 'forth-block-mode)
(require 'forth-interaction-mode)

(add-to-list 'auto-mode-alist '("\\.frt$" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.fth$" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.feline" . forth-mode))
