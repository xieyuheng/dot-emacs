(if (<= (length command-line-args) 1)
    (let ((filename "~/inner/TODO.md"))
      (when (file-exists-p filename)
        (setq initial-buffer-choice filename))))
