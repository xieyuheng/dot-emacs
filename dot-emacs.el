;;;; modules

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/modules")

;;;; configs

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src")

(load "config-m-x")
(load "config-keys")
(load "config-settings")
(load "config-hippie-expand")
(load "config-theme")
(load "config-fonts")
(load "config-initial-buffer")
(load "config-eshell")
(load "config-ranger")
(load "config-region-state")
(load "config-x-clipboard-yank")
(load "config-projectile")
(load "config-emacs-server")
(load "config-paredit")

;;;; langs

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/langs")

(load "config-markdown")
(load "config-scheme")
(load "config-lisp")
(load "config-racket")
