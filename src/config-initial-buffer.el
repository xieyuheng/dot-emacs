(if (<= (length command-line-args) 1)
    (let ((filename "~/todo/TODO.md"))
      (when (file-exists-p filename)
        (setq initial-buffer-choice filename))))
