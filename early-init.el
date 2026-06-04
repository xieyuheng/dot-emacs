(setq package-enable-at-startup nil)

(setq package-user-dir (locate-user-emacs-file "var/elpa/"))
(setq tramp-auto-save-directory (locate-user-emacs-file "var/tramp/"))
(setq tramp-persistency-file-name (locate-user-emacs-file "var/tramp-persistency"))
(setq auto-save-list-file-prefix (locate-user-emacs-file "var/auto-save-list/"))
(setq backup-directory-alist `(("." . ,(locate-user-emacs-file "var/backups/"))))
(setq eshell-directory-name (locate-user-emacs-file "var/eshell/"))
(setq ivy-history-file (locate-user-emacs-file "var/ivy-history"))
