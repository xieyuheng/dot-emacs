(defun switch-to-eshell ()
  (interactive)
  (eshell))

(global-set-key (kbd "C-s C-e") 'switch-to-eshell)

(add-hook 'eshell-mode-hook
          (lambda ()
            (local-set-key (kbd "C-s C-e") 'previous-buffer)))

(defun eshell/ll (&rest args)
  (apply #'eshell/ls (cons "-l" args)))

(defun eshell/e (&rest args)
  (apply #'find-file args))
