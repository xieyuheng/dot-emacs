;;; x-sidebar.el --- Simple dired sidebar -*- lexical-binding: t; -*-

(require 'cl-lib)

(defvar x-sidebar--width 30 "Sidebar width in columns.")

(defvar x-sidebar--state nil
  "Alist of (frame . buffer) for each frame.")

(defun x-sidebar--state-entry ()
  (or (assq (selected-frame) x-sidebar--state)
      (car (push (cons (selected-frame) nil) x-sidebar--state))))

(defun x-sidebar--buffer ()
  (cdr (x-sidebar--state-entry)))

(defun x-sidebar--set-buffer (buf)
  (setcdr (x-sidebar--state-entry) buf))

(defun x-sidebar--find-window ()
  "Find a *x-sidebar* window on the current frame, or nil."
  (let ((frame (selected-frame)))
    (cl-find-if (lambda (w)
                  (and (eq (window-frame w) frame)
                       (string-prefix-p "*x-sidebar*"
                                        (buffer-name (window-buffer w)))))
                (window-list))))

(defun x-sidebar ()
  "Toggle a dired sidebar on the left."
  (interactive)
  (let ((win (x-sidebar--find-window)))
    (if win
        (let ((dir default-directory))
          (select-window win)
          (x-sidebar--enter-dir dir))
      (let ((buf (x-sidebar--make-buffer default-directory)))
        (x-sidebar--set-buffer buf)
        (delete-other-windows)
        (let ((new-win (split-window (selected-window) (- x-sidebar--width) 'left)))
          (set-window-buffer new-win buf))
        (select-window (x-sidebar--find-window))
        (x-sidebar--preview)))))

(defun x-sidebar--remove-from-dired-buffers ()
  (setq dired-buffers
        (cl-remove-if (lambda (entry)
                        (let ((buf (if (consp entry) (cdr entry) entry)))
                          (and (buffer-live-p buf)
                               (string-prefix-p "*x-sidebar*" (buffer-name buf)))))
                      dired-buffers)))

(defun x-sidebar--fresh-dired-buffer (dir)
  (let ((dired-buffers nil))
    (dired-noselect (file-name-as-directory (expand-file-name dir)))))

(defun x-sidebar--setup ()
  (dired-hide-details-mode 1)
  (x-sidebar--setup-keys)
  (auto-revert-mode 1)
  (add-hook 'post-command-hook #'x-sidebar--preview nil t)
  (x-sidebar--remove-from-dired-buffers))

(defun x-sidebar--make-buffer (dir)
  (let ((buf (x-sidebar--fresh-dired-buffer dir)))
    (with-current-buffer buf
      (rename-buffer (generate-new-buffer-name "*x-sidebar*"))
      (x-sidebar--setup))
    buf))

(defun x-sidebar--get-or-create-buffer (dir)
  (let* ((full (file-name-as-directory (expand-file-name dir)))
         (my-buf (x-sidebar--buffer)))
    (if (and my-buf (buffer-live-p my-buf))
        (progn
          (with-current-buffer my-buf
            (unless (string= (expand-file-name dired-directory) full)
              (setq-local dired-directory full)
              (setq-local default-directory full)
              (revert-buffer))
            (x-sidebar--remove-from-dired-buffers))
          my-buf)
      (x-sidebar--make-buffer dir))))

(defun x-sidebar--setup-keys ()
  (local-set-key (kbd "RET") 'x-sidebar--ret)
  (local-set-key (kbd "l") 'x-sidebar--ret)
  (local-set-key (kbd "<right>") 'x-sidebar--ret)
  (local-set-key (kbd "C-s C-w") 'x-sidebar--switch-to-main)
  (local-set-key (kbd "j") 'dired-next-line)
  (local-set-key (kbd "<down>") 'dired-next-line)
  (local-set-key (kbd "k") 'dired-previous-line)
  (local-set-key (kbd "<up>") 'dired-previous-line)
  (local-set-key (kbd "h") 'x-sidebar--up-directory)
  (local-set-key (kbd "<left>") 'x-sidebar--up-directory))

(defun x-sidebar--ret ()
  "RET handler: enter directory in sidebar or open file in main window."
  (interactive)
  (let ((file (dired-get-file-for-visit)))
    (if (file-directory-p file)
        (x-sidebar--enter-dir file)
      (let ((main-win (x-sidebar--main-window)))
        (when main-win
          (select-window main-win)
          (find-file file)
          (select-window (x-sidebar--find-window)))))))

(defun x-sidebar--enter-dir (dir)
  "Enter DIR in the sidebar."
  (let ((buf (x-sidebar--get-or-create-buffer dir)))
    (x-sidebar--set-buffer buf)
    (setq-local x-sidebar--last-preview nil)
    (set-window-buffer (selected-window) buf)
    (x-sidebar--preview)))

(defun x-sidebar--up-directory ()
  "Go to the parent directory in the sidebar."
  (interactive)
  (let* ((current (expand-file-name default-directory))
         (parent (file-name-directory (directory-file-name current))))
    (when (and parent (not (string= parent current)))
      (x-sidebar--enter-dir parent)
      (ignore-errors (dired-goto-file current)))))

(defvar-local x-sidebar--last-preview nil)

(defun x-sidebar--preview ()
  "Preview the file at point in the main window."
  (let ((file (ignore-errors (dired-get-file-for-visit))))
    (when (and file (not (equal file x-sidebar--last-preview)))
      (setq x-sidebar--last-preview file)
      (let ((buf (if (file-directory-p file)
                     (dired-noselect file)
                   (find-file-noselect file)))
            (main-win (x-sidebar--main-window)))
        (when main-win
          (set-window-buffer main-win buf))))))

(defun x-sidebar--main-window ()
  (let ((cur (selected-window)))
    (or (cl-find-if (lambda (w) (not (eq w cur))) (window-list))
        (let* ((file (ignore-errors (dired-get-file-for-visit)))
               (buf (cond (file (if (file-directory-p file)
                                    (dired-noselect file)
                                  (find-file-noselect file)))
                          (t (other-buffer (current-buffer)))))
               (new-win (split-window cur x-sidebar--width 'right)))
          (set-window-buffer new-win buf)
          new-win))))

(defun x-sidebar--switch-to-main ()
  "Switch focus to the main window."
  (interactive)
  (let ((main-win (x-sidebar--main-window)))
    (when main-win
      (select-window main-win))))

(provide 'x-sidebar)
;;; x-sidebar.el ends here
