(defun open-new-eshell-in-current-dir ()
  (interactive)
  (eshell t)
  (cd default-directory))

(global-set-key (kbd "C-s C-e") 'open-new-eshell-in-current-dir)

(add-hook
 'eshell-mode-hook
 (lambda ()
   (local-set-key (kbd "C-s C-e") 'previous-buffer)))

(defun eshell/ll (&rest args)
  (apply #'eshell/ls (cons "-l" args)))

(defun eshell/e (&rest args)
  (apply #'find-file args))
