;;;; forth-mode

(add-to-list 'load-path "~/.emacs.d/deps/forth-mode/")

(autoload 'forth-mode "forth-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.fs\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.fth\\'" . forth-mode))
(add-to-list 'auto-mode-alist '("\\.4th\\'" . forth-mode))
(add-to-list 'interpreter-mode-alist '("gforth" . forth-mode))

(provide 'config-forth)
