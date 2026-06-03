;;; x-dired-sidebar.el --- Simple dired sidebar -*- lexical-binding: t; -*-

(require 'cl-lib)

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
        (x-dired-sidebar--setup-keys)
        (add-hook 'post-command-hook #'x-dired-sidebar--preview nil t)))
    (display-buffer-in-side-window
     x-dired-sidebar--buffer
     `((side . left) (window-width . ,x-dired-sidebar--width)))
    (select-window (get-buffer-window x-dired-sidebar--buffer))
    (x-dired-sidebar--preview)))

(defun x-dired-sidebar--setup-keys ()
  (local-set-key (kbd "RET") 'x-dired-sidebar--ret)
  (local-set-key (kbd "l") 'x-dired-sidebar--ret)
  (local-set-key (kbd "<right>") 'x-dired-sidebar--ret)
  (local-set-key (kbd "C-s C-w") 'other-window)
  (local-set-key (kbd "j") 'dired-next-line)
  (local-set-key (kbd "<down>") 'dired-next-line)
  (local-set-key (kbd "k") 'dired-previous-line)
  (local-set-key (kbd "<up>") 'dired-previous-line)
  (local-set-key (kbd "h") 'x-dired-sidebar--up-directory)
  (local-set-key (kbd "<left>") 'x-dired-sidebar--up-directory))

(defun x-dired-sidebar--ret ()
  "RET handler: enter directory in sidebar or open file in main window."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
        (x-dired-sidebar--enter-dir file)
      (dired-find-file-other-window))))

(defun x-dired-sidebar--enter-dir (dir)
  (let* ((full (file-name-as-directory (expand-file-name dir)))
         (buf (current-buffer)))
    (with-current-buffer buf
      (let ((inhibit-read-only t))
        (kill-all-local-variables)
        (dired full dired-listing-switches)
        (rename-buffer "*x-dired-sidebar*")
        (dired-hide-details-mode 1)
        (x-dired-sidebar--setup-keys)
        (add-hook 'post-command-hook #'x-dired-sidebar--preview nil t)
        (setq x-dired-sidebar--last-preview nil))
      (setq x-dired-sidebar--buffer buf))))

(defun x-dired-sidebar--up-directory ()
  (interactive)
  (let ((parent (file-name-directory (directory-file-name default-directory))))
    (when parent
      (x-dired-sidebar--enter-dir parent))))

(defvar-local x-dired-sidebar--last-preview nil)

(defun x-dired-sidebar--preview ()
  "Preview the file at point in the main window."
  (let ((file (ignore-errors (dired-get-file-for-visit))))
    (when (and file
               (not (file-directory-p file))
               (not (equal file x-dired-sidebar--last-preview)))
      (setq x-dired-sidebar--last-preview file)
      (x-dired-sidebar--display-in-other-window (find-file-noselect file)))))

(defun x-dired-sidebar--display-in-other-window (buffer)
  (let* ((win (selected-window))
         (other (or (cl-find-if (lambda (w) (not (eq w win))) (window-list))
                    (split-window win nil 'right))))
    (set-window-buffer other buffer)))

(provide 'x-dired-sidebar)
;;; x-dired-sidebar.el ends here
