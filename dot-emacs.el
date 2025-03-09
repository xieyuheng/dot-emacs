;; (setq gc-cons-threshold most-positive-fixnum)

;;;; modules

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/modules")

;;;; configs (no extra dependency)

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src")

(load "config-keys")
(load "config-settings")
(load "config-fonts")
(load "config-initial-buffer")
(load "config-emacs-server")
(load "config-eshell")

;;;; theme

(load "config-theme")

;;;; packages

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/packages")

(load "config-smex")
(load "config-ranger")
(load "config-region-state")
(load "config-paredit")

;;;; langs

(add-to-list 'load-path "~/.emacs.d/dot-emacs/src/langs")

(load "config-scheme")
(load "config-lisp")
(load "config-racket")
(load "config-clojure")

(load "config-typescript")
(load "config-web")
(load "config-markdown")
(load "config-yaml")

(load "config-c")
(load "config-python")
(load "config-scala")
(load "config-cicada")
(load "config-go")
(load "config-rust")
(load "config-lua")
(load "config-julia")

(load "config-forth")
(load "config-uxn")

(load "config-sml")
(load "config-caml")
(load "config-agda")

;; (setq gc-cons-threshold (* 100 1024 1024)) ;; 100 MB

(garbage-collect)
