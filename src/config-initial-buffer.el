(setq initial-major-mode 'markdown-mode)

(if (<= (length command-line-args) 1)
    (let ((filename "~/.emacs.d/scratch.md"))
      (when (not (file-exists-p filename))
        (make-empty-file filename))
      (setq initial-buffer-choice filename)))

;; (if (<= (length command-line-args) 1)
;;     (let ((filename "~/inner/TODO.md"))
;;       (when (file-exists-p filename)
;;         (setq initial-buffer-choice filename))))
