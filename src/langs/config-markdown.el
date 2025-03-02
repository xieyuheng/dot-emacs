(add-to-list 'load-path "~/.emacs.d/markdown-mode/")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(setq markdown-fontify-code-blocks-natively t)

(add-hook
 'markdown-mode-hook
 (lambda ()
   (local-set-key (kbd "C-s C-s") 'markdown-edit-code-block)
   (local-set-key (kbd "M-p") 'backward-paragraph)
   (local-set-key (kbd "M-n") 'forward-paragraph)))

;;;; code block

(add-to-list 'load-path "~/.emacs.d/edit-indirect/")
(require 'edit-indirect)
(define-key edit-indirect-mode-map (kbd "C-s C-s") 'edit-indirect-commit)
