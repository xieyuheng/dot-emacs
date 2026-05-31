(defun x-save-buffer ()
  (interactive)
  (let ((inhibit-message t))
     (save-buffer))
  (let* ((prefix "(save) ")
         (right-margin 0)
         (max-width (- (window-total-width (minibuffer-window))
                       (+ (length prefix) right-margin))))
    (message
     "%s%s"
     prefix
     (truncate-string-to-width
      (file-name-nondirectory (buffer-file-name))
      max-width nil nil "…"))))

(provide 'x-save-buffer)
