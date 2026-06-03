;;; x-dired-sidebar.el --- Simple dired sidebar -*- lexical-binding: t; -*-

(defvar x-dired-sidebar--buffer nil "The sidebar dired buffer.")
(defvar x-dired-sidebar--width 30 "Sidebar width in columns.")

(defun x-dired-sidebar ()
  "Toggle a dired sidebar on the left."
  (interactive)
  (if (and x-dired-sidebar--buffer
           (buffer-live-p x-dired-sidebar--buffer)
           (get-buffer-window x-dired-sidebar--buffer))
      (delete-window (get-buffer-window x-dired-sidebar--buffer))
    (unless (and x-dired-sidebar--buffer
                 (buffer-live-p x-dired-sidebar--buffer))
      (setq x-dired-sidebar--buffer
            (dired-noselect default-directory))
      (with-current-buffer x-dired-sidebar--buffer
        (rename-buffer "*x-dired-sidebar*")
        (dired-hide-details-mode 1)
        (local-set-key (kbd "RET") 'dired-find-file-other-window)
        (local-set-key (kbd "C-s C-w") 'other-window)))
    (display-buffer-in-side-window
     x-dired-sidebar--buffer
     `((side . left) (window-width . ,x-dired-sidebar--width)))
    (select-window (get-buffer-window x-dired-sidebar--buffer))))

(provide 'x-dired-sidebar)
;;; x-dired-sidebar.el ends here
