(add-to-list 'load-path "~/.emacs.d/agda-mode/")

(autoload 'agda2-mode "agda2-mode"
  "Major mode for editing Agda files (version ≥ 2)." t)

(add-to-list 'auto-mode-alist '("\\.l?agda\\'" . agda2-mode))
(modify-coding-system-alist 'file "\\.l?agda\\'" 'utf-8)

(require 'agda2)
