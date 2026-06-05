(defun x-delete-frame-or-exit ()
  (interactive)
  (if (> (length (frame-list)) 1)
      (delete-frame (selected-frame))
    (let ((kill-emacs-query-functions nil))
      (kill-emacs))))

(provide 'x-delete-frame-or-exit)
