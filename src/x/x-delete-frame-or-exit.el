(defun x-delete-frame-or-exit ()
  (interactive)
  (if (> (length (frame-list)) 1)
      (let ((frame (selected-frame)))
        (save-some-buffers)
        (delete-frame frame))
    (save-buffers-kill-emacs)))

(provide 'x-delete-frame-or-exit)
