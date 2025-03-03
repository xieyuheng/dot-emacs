;;;; this was the default

;; (global-set-key (kbd "M-x") 'execute-extended-command)

;;;; smex

(add-to-list 'load-path "~/.emacs.d/smex/")
(require 'smex)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-z") 'smex-major-mode-commands)

;;;; ido-vertical

(add-to-list 'load-path "~/.emacs.d/ido-vertical-mode/")
(require 'ido-vertical-mode)

(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
