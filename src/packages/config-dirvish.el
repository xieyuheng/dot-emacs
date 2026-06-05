;;;; dirvish

(add-to-list 'load-path "~/.emacs.d/deps/dirvish/")

(setq dirvish-cache-dir
      (expand-file-name "var/dirvish/" user-emacs-directory))

(require 'dirvish)

(define-key dired-mode-map (kbd "h") 'dired-up-directory)
(define-key dired-mode-map (kbd "j") 'next-line)
(define-key dired-mode-map (kbd "k") 'previous-line)
(define-key dired-mode-map (kbd "l") 'dired-find-file)
(define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
(define-key dired-mode-map (kbd "<tab>") 'dirvish-layout-toggle)

(dirvish-override-dired-mode 1)
