(add-to-list 'load-path "~/.emacs.d/clojure-mode/")
(require 'clojure-mode)

(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook
 'clojure-mode-hook
 (lambda ()
   ;; (paren-face-mode)
   (local-set-key (kbd "C-x C-e") 'scheme-send-last-sexp-split-window)
   (local-set-key (kbd "C-c C-e") 'scheme-send-definition-split-window)
   (local-set-key (kbd "C-<tab>") 'scheme-easy-to-eval)))

(defun run-clojure ()
  (interactive)
  ;; (run-scheme "java -cp /home/xyh/lang/clojure/clojure-1.8.0/clojure-1.8.0.jar clojure.main")
  (run-scheme "lein repl"))
