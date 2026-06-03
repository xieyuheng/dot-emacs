;;; x-sidebar.el --- Simple dired sidebar -*- lexical-binding: t; -*-

(require 'cl-lib)

(defvar x-sidebar--width 30 "Sidebar width in columns.")

(defun x-sidebar--buffer ()
  "Return the sidebar buffer for the current frame."
  (frame-parameter nil 'x-sidebar--buffer))

(defun x-sidebar--set-buffer (buf)
  "Set the sidebar buffer for the current frame."
  (set-frame-parameter nil 'x-sidebar--buffer buf))

(defun x-sidebar--window ()
  "Return the sidebar window for the current frame."
  (frame-parameter nil 'x-sidebar--window))

(defun x-sidebar--set-window (win)
  "Set the sidebar window for the current frame."
  (set-frame-parameter nil 'x-sidebar--window win))

(defun x-sidebar ()
  "Toggle a dired sidebar on the left."
  (interactive)
  (let ((win (x-sidebar--window)))
    (if (and win (window-live-p win) (eq (window-frame win) (selected-frame)))
        (progn
          (delete-window win)
          (x-sidebar--set-window nil))
      (let ((buf (dired-noselect default-directory)))
        (with-current-buffer buf
          (x-sidebar--setup))
        (x-sidebar--set-buffer buf)
        (let ((new-win (split-window (selected-window) (- x-sidebar--width) 'left)))
          (set-window-buffer new-win buf)
          (x-sidebar--set-window new-win))
        (select-window (x-sidebar--window))
        (x-sidebar--preview)))))

(defun x-sidebar--setup ()
  (rename-buffer (generate-new-buffer-name "*x-sidebar*"))
  (dired-hide-details-mode 1)
  (x-sidebar--setup-keys)
  (add-hook 'post-command-hook #'x-sidebar--preview nil t))

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
          (select-window (x-sidebar--window)))))))

(defun x-sidebar--enter-dir (dir)
  "Enter DIR in the sidebar."
  (let* ((full (file-name-as-directory (expand-file-name dir)))
         (buf (or (car (dired-buffers-for-dir full))
                  (dired-noselect full))))
    (with-current-buffer buf
      (x-sidebar--setup))
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
  (let ((frame (selected-frame))
        (sbar-win (x-sidebar--window)))
    (cl-find-if (lambda (w)
                  (and (not (eq w sbar-win))
                       (eq (window-frame w) frame)))
                (window-list))))

(defun x-sidebar--switch-to-main ()
  "Switch focus to the main window."
  (interactive)
  (let ((main-win (x-sidebar--main-window)))
    (when main-win
      (select-window main-win))))

(provide 'x-sidebar)
;;; x-sidebar.el ends here
