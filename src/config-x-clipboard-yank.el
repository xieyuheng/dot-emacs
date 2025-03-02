(defun x-clipboard-yank ()
  (interactive)
  (insert (eshell-command-result "xclip -o")))

(global-set-key (kbd "C-M-y") 'x-clipboard-yank)
