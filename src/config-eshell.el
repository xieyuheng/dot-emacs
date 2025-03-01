(defun switch-to-eshell ()
  (interactive)
  (eshell))

(global-set-key (kbd "C-s C-e") 'switch-to-eshell)

(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-s C-e") 'previous-buffer)))
