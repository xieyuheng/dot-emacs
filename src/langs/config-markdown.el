(add-to-list 'load-path "~/.emacs.d/deps/markdown-mode/")

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

(add-to-list 'load-path "~/.emacs.d/deps/edit-indirect/")
(require 'edit-indirect)
(define-key edit-indirect-mode-map (kbd "C-s C-s") 'edit-indirect-commit)

(add-to-list 'display-buffer-alist
             '("\\*edit-indirect" display-buffer-same-window))
(advice-add 'edit-indirect-commit :around
            (lambda (orig-fun &rest args)
              (let ((parent (overlay-buffer edit-indirect--overlay)))
                (apply orig-fun args)
                (with-current-buffer parent
                  (save-buffer)))))
