(defun x-paste-from-clipboard ()
  (interactive)
  (insert (eshell-command-result "xclip -o")))

(provide 'x-paste-from-clipboard)
