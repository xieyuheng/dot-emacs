;;;; magit

(add-to-list 'load-path "~/.emacs.d/deps/magit/lisp/")
(add-to-list 'load-path "~/.emacs.d/deps/transient/lisp/")
(add-to-list 'load-path "~/.emacs.d/deps/with-editor/lisp/")
(add-to-list 'load-path "~/.emacs.d/deps/compat/")
(add-to-list 'load-path "~/.emacs.d/deps/cond-let/")
(add-to-list 'load-path "~/.emacs.d/deps/llama/")
(setq transient-levels-file
      (expand-file-name "var/transient/levels.el" user-emacs-directory))
(setq transient-values-file
      (expand-file-name "var/transient/values.el" user-emacs-directory))
(setq transient-history-file
      (expand-file-name "var/transient/history.el" user-emacs-directory))

(require 'magit)

(global-set-key (kbd "C-x g") 'magit-status)
