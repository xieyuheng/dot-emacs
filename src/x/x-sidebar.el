;;; x-sidebar.el --- Simple file sidebar -*- lexical-binding: t; -*-

(require 'cl-lib)

(defvar x-sidebar--width 30 "Sidebar width in columns.")

(defvar x-sidebar--state nil
  "Alist of (frame . buffer) for each frame.")

(defvar x-sidebar-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map special-mode-map)
    (define-key map (kbd "RET") 'x-sidebar--ret)
    (define-key map (kbd "l") 'x-sidebar--ret)
    (define-key map (kbd "<right>") 'x-sidebar--ret)
    (define-key map (kbd "C-s C-w") 'x-sidebar--switch-to-main)
    (define-key map (kbd "j") 'next-line)
    (define-key map (kbd "<down>") 'next-line)
    (define-key map (kbd "k") 'previous-line)
    (define-key map (kbd "<up>") 'previous-line)
    (define-key map (kbd "h") 'x-sidebar--up-directory)
    (define-key map (kbd "<left>") 'x-sidebar--up-directory)
    map)
  "Keymap for x-sidebar-mode.")

(define-derived-mode x-sidebar-mode special-mode "XSidebar"
  (setq-local truncate-lines t)
  (setq-local revert-buffer-function #'x-sidebar--revert)
  (setq-local buffer-stale-function #'x-sidebar--buffer-stale-p)
  (auto-revert-mode 1)
  (add-hook 'post-command-hook #'x-sidebar--preview nil t))

(defvar-local x-sidebar--last-mtime nil)
(defvar-local x-sidebar--last-preview nil)

(defun x-sidebar--buffer-stale-p (&optional _noconfirm)
  (let ((attrs (file-attributes default-directory)))
    (and attrs
         (not (equal (file-attribute-modification-time attrs)
                     x-sidebar--last-mtime)))))

(defun x-sidebar--revert (&optional _ignore-auto _noconfirm)
  (let ((current-entry (x-sidebar--entry-at-point)))
    (x-sidebar--list-directory default-directory)
    (when current-entry
      (x-sidebar--goto-entry current-entry))
    (goto-char (min (point) (point-max)))))

(defun x-sidebar--entry-rank (path is-dir)
  (cond ((string-prefix-p "."
                          (file-name-nondirectory
                           (directory-file-name path)))
         2)
        (is-dir 0)
        (t 1)))

(defun x-sidebar--sort-entries (entries)
  (sort entries
        (lambda (a b)
          (let* ((da (file-directory-p a))
                 (db (file-directory-p b))
                 (ra (x-sidebar--entry-rank a da))
                 (rb (x-sidebar--entry-rank b db)))
            (if (= ra rb)
                (string< a b)
              (< ra rb))))))

(defun x-sidebar--face-for-entry (path name)
  (cond ((string-prefix-p "." name) 'shadow)
        ((file-directory-p path) 'font-lock-function-name-face)
        ((file-symlink-p path) 'font-lock-constant-face)
        ((and (file-executable-p path)
              (not (file-directory-p path)))
         'font-lock-warning-face)
        (t nil)))

(defun x-sidebar--list-directory (dir)
  (let* ((full-dir (file-name-as-directory (expand-file-name dir)))
         (entries (directory-files full-dir t directory-files-no-dot-files-regexp))
         (sorted (x-sidebar--sort-entries entries))
         (inhibit-read-only t))
    (erase-buffer)
    (let* ((dname (file-name-nondirectory (directory-file-name full-dir)))
            (dname (if (string= dname "") "/" dname))
            (start (point)))
      (insert " " dname (if (string= dname "/") "\n" "/\n"))
      (put-text-property start (point) 'x-sidebar-path full-dir)
      (put-text-property start (point) 'face 'font-lock-comment-face))
    (dolist (full sorted)
      (let* ((start (point))
             (name (file-name-nondirectory (directory-file-name full)))
             (face (x-sidebar--face-for-entry full name)))
        (insert " "
                (if (file-directory-p full)
                    (concat name "/\n")
                  (concat name "\n")))
        (put-text-property start (point) 'x-sidebar-path full)
        (when face
          (put-text-property start (point) 'face face))))
    (goto-char (point-min))
    (setq-local default-directory full-dir)
    (setq x-sidebar--last-mtime
          (file-attribute-modification-time
           (file-attributes full-dir)))))

(defun x-sidebar--entry-at-point ()
  (get-text-property (line-beginning-position) 'x-sidebar-path))

(defun x-sidebar--goto-entry (path)
  (let ((pos nil)
        (dpath (directory-file-name path)))
    (goto-char (point-min))
    (while (and (not pos) (not (eobp)))
      (let ((p (get-text-property (line-beginning-position) 'x-sidebar-path)))
        (when (or (equal p path) (equal p dpath))
          (setq pos (line-beginning-position))))
      (forward-line 1))
    (when pos
      (goto-char pos))))

(defun x-sidebar--state-entry ()
  (or (assq (selected-frame) x-sidebar--state)
      (car (push (cons (selected-frame) nil) x-sidebar--state))))

(defun x-sidebar--buffer ()
  (cdr (x-sidebar--state-entry)))

(defun x-sidebar--set-buffer (buf)
  (setcdr (x-sidebar--state-entry) buf))

(defun x-sidebar--find-window ()
  (let ((frame (selected-frame)))
    (cl-find-if (lambda (w)
                  (and (eq (window-frame w) frame)
                       (string-prefix-p "*x-sidebar*"
                                         (buffer-name (window-buffer w)))))
                (window-list))))

(defun x-sidebar--initial-dir ()
  (if (derived-mode-p 'dired-mode)
      (or (file-name-directory (directory-file-name default-directory))
          (expand-file-name default-directory))
    default-directory))

(defun x-sidebar ()
  "Toggle a dired sidebar on the left."
  (interactive)
  (let ((win (x-sidebar--find-window))
        (dir (x-sidebar--initial-dir))
        (orig (cond ((derived-mode-p 'dired-mode)
                     (directory-file-name (expand-file-name default-directory)))
                    ((buffer-file-name)
                     (expand-file-name (buffer-file-name)))
                    (t nil))))
    (if win
        (progn
          (select-window win)
          (x-sidebar--enter-dir dir))
      (let ((buf (x-sidebar--make-buffer dir)))
        (x-sidebar--set-buffer buf)
        (delete-other-windows)
        (let ((new-win (split-window (selected-window) (- x-sidebar--width) 'left)))
          (set-window-buffer new-win buf))
        (select-window (x-sidebar--find-window))
        (when orig
          (x-sidebar--goto-entry orig))
        (x-sidebar--preview)))))

(defun x-sidebar--make-buffer (dir)
  (let ((buf (generate-new-buffer "*x-sidebar*")))
    (with-current-buffer buf
      (x-sidebar-mode)
      (x-sidebar--list-directory dir))
    buf))

(defun x-sidebar--get-or-create-buffer (dir)
  (let* ((full (file-name-as-directory (expand-file-name dir)))
         (my-buf (x-sidebar--buffer)))
    (if (and my-buf (buffer-live-p my-buf))
        (progn
          (with-current-buffer my-buf
            (unless (string= (expand-file-name default-directory) full)
              (setq-local default-directory full)
              (x-sidebar--list-directory full)))
          my-buf)
      (x-sidebar--make-buffer dir))))

(defun x-sidebar--enter-dir (dir)
  (let ((buf (x-sidebar--get-or-create-buffer dir)))
    (x-sidebar--set-buffer buf)
    (setq-local x-sidebar--last-preview nil)
    (set-window-buffer (selected-window) buf)
    (x-sidebar--preview)))

(defun x-sidebar--ret ()
  (interactive)
  (let ((file (x-sidebar--entry-at-point)))
    (when file
      (if (file-directory-p file)
          (x-sidebar--enter-dir file)
        (let ((main-win (x-sidebar--main-window)))
          (when main-win
            (select-window main-win)
            (find-file file)
            (select-window (x-sidebar--find-window))))))))

(defun x-sidebar--up-directory ()
  (interactive)
  (let* ((current (expand-file-name default-directory))
         (parent (file-name-directory (directory-file-name current))))
    (when (and parent (not (string= parent current)))
      (x-sidebar--enter-dir parent)
      (x-sidebar--goto-entry current))))

(defun x-sidebar--preview ()
  (let ((file (x-sidebar--entry-at-point)))
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
        (let* ((file (x-sidebar--entry-at-point))
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
