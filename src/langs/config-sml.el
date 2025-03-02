(add-to-list 'load-path "~/.emacs.d/sml/")

(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)
(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))

(setq sml-program-name "sml")
;; (setq sml-program-name "hamlet")

(require 'sml-mode)

(add-hook
 'sml-mode-hook
 (lambda ()
   (define-key sml-mode-map (kbd "C-x C-e") 'sml-send-function)
   (turn-off-indent)))
