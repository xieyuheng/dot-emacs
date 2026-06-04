(defgroup x-modeline nil
  "X modeline"
  :group 'mode-line)

(defface x-modeline-active
  '((t (:inherit mode-line :background "#303030" :foreground "#ffffff")))
  "Face for mode-line text."
  :group 'x-modeline)

(defface x-modeline-status-active
  '((t (:inherit x-modeline-active :background "#e8e8e8" :foreground "#000000")))
  "Face for buffer status indicator when window is active."
  :group 'x-modeline)

(defface x-modeline-status-inactive
  '((t (:inherit x-modeline-active)))
  "Face for buffer status indicator when window is inactive."
  :group 'x-modeline)

(defvar x-modeline--selected-window nil)

(defun x-modeline--update-selected-window ()
  (setq x-modeline--selected-window (selected-window)))

(add-hook 'post-command-hook #'x-modeline--update-selected-window)

(defun x-modeline--active-p ()
  (eq (selected-window) x-modeline--selected-window))

(defun x-modeline--buffer-status ()
  (let ((s (cond (buffer-read-only "只读")
                 ((buffer-modified-p) "未存")
                 (t "编辑"))))
    (propertize s 'face (if (x-modeline--active-p)
                            'x-modeline-status-active
                          'x-modeline-status-inactive))))

(defun x-modeline--buffer-name ()
  (propertize (buffer-name) 'face 'x-modeline-active))

(defun x-modeline--vc-branch ()
  (when vc-mode
    (let ((s (substring-no-properties vc-mode)))
      (when (and (string-prefix-p " Git" s)
                 (setq s (substring s 4))
                 (string-match "[-:]" s))
        (setq s (substring s (1+ (match-beginning 0)))))
      (propertize (format "(%s)" s) 'face 'x-modeline-active))))

(defun x-modeline--cursor-position ()
  (propertize (format-mode-line "%l:%c") 'face 'x-modeline-active))

(defun x-modeline--spc (&optional n)
  (propertize (make-string (or n 1) ?\s) 'face 'x-modeline-active))

(defun x-modeline--build ()
  (let* ((left (concat (x-modeline--buffer-status)
                       (x-modeline--spc 1)
                       (x-modeline--buffer-name)
(x-modeline--spc 1)
(x-modeline--vc-branch)))
         (right (x-modeline--cursor-position))
         (right-len (length right)))
    (concat (propertize " " 'display `(space :align-to 0))
            left
            (propertize " " 'face 'x-modeline-active
                        'display `(space :align-to (- right ,right-len)))
            right)))

(setq-default mode-line-format
              '((:eval (x-modeline--build))))

(set-face-attribute 'mode-line nil
                    :background "#303030"
                    :foreground "#ffffff"
                    :box 'unspecified)

(set-face-attribute 'mode-line-inactive nil
                    :background "#303030"
                    :foreground "#ffffff"
                    :box 'unspecified)

(provide 'x-modeline)
