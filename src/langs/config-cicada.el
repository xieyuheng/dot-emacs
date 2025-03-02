(add-to-list 'load-path "~/.emacs.d/cicada-mode/")
(require 'cicada-mode)

(add-to-list 'interpreter-mode-alist '("cicada" . cicada-mode))

(add-to-list 'auto-mode-alist '("\\.cic\\'" . cicada-mode))
(add-to-list 'auto-mode-alist '("\\.ch\\'" . cicada-mode))
