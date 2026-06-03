;;;; fzf

(add-to-list 'load-path "~/.emacs.d/deps/fzf.el/")
(require 'fzf)

(setq fzf/window-width 0.6)

(global-set-key (kbd "C-s C-f") 'fzf-git)
(global-set-key (kbd "C-s C-g") 'fzf-git-grep)
