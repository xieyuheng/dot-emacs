(add-to-list 'load-path "~/.emacs.d/deps/yaml-mode/")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
