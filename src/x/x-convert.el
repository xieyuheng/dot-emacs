(defun x-convert-to-kebab () (interactive) (forward-word) (delete-char 1) (insert "-"))
(defun x-convert-to-snake () (interactive) (forward-word) (delete-char 1) (insert "_"))

(provide 'x-convert)
