;;;; x

(add-to-list 'load-path "~/.emacs.d/src/x")

(require 'x-convert)
(require 'x-cycle-brackets)
(require 'x-jump-to-file)
(require 'x-kill-current-buffer)
(require 'x-paste-from-clipboard)
(require 'x-save-buffer)
(require 'x-toggle-comment)
(require 'x-delete-frame-or-exit)
(require 'x-sidebar)
(require 'x-modeline)

;;;; packages

(add-to-list 'load-path "~/.emacs.d/src/packages")

(load "config-swiper")
(load "config-region-state")
(load "config-paredit")
(load "config-warden-mode")
(load "config-magit")
(load "config-vterm")

;;;; configs

(add-to-list 'load-path "~/.emacs.d/src")

(load "config-keys")
(load "config-settings")
(load "config-fonts")
(load "config-initial-buffer")
(load "config-emacs-server")
(load "config-eshell")
(load "config-theme")

;;;; langs

(add-to-list 'load-path "~/.emacs.d/src/langs")

(load "config-scheme")
(load "config-lisp")
(load "config-meta-lisp")
(load "config-clojure")
(load "config-typescript")
(load "config-web")
(load "config-markdown")
(load "config-yaml")
(load "config-c")
(load "config-python")
(load "config-scala")
(load "config-uxn")
(load "config-asm")
(load "config-caml")
