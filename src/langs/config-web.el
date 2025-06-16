(add-to-list 'load-path "~/.emacs.d/web-mode/")
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mimor\\'" . web-mode))

(define-key web-mode-map (kbd "C-c C-c") 'web-mode-tag-match)

(setq web-mode-enable-auto-indentation nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)

;;;; css

(setq css-indent-offset 2)

;;;; html

(add-hook
 'html-mode-hook
 (lambda ()
   (set (make-local-variable 'sgml-basic-offset) 2)))

;;;; emmet-mode -- quick expend

(add-to-list 'load-path "~/.emacs.d/emmet-mode")
(require 'emmet-mode)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook (lambda () (electric-indent-local-mode -1)))

(add-to-list 'emmet-jsx-major-modes 'js-jsx-mode)
(add-hook
 'js-jsx-mode-hook
 (lambda ()
   (define-key js-jsx-mode-map (kbd "C-j") 'emmet-expand-line)))

(add-hook
 'typescript-mode-hook
 (lambda ()
   (define-key typescript-mode-map (kbd "C-j") 'emmet-expand-line)))

;;;; wasm

(add-to-list 'load-path "~/.emacs.d/wat-mode/")
(require 'wat-mode)
(add-to-list 'auto-mode-alist '("\\.wat\\'" . wat-mode))
(add-to-list 'auto-mode-alist '("\\.wast\\'" . wat-mode))

;;;; json

(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
