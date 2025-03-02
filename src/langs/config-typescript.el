(add-to-list 'load-path "~/.emacs.d/typescript.el/")
(require 'typescript-mode)

(add-hook
 'typescript-mode-hook
 (lambda ()
   (setq typescript-indent-level 2)
   (setq tab-width 2)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.cjs\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.d.ts\\'" . typescript-mode))
