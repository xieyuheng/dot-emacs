(add-to-list 'load-path "~/.emacs.d/ranger.el/")
(require 'ranger)

(global-set-key (kbd "C-s C-w") 'ranger)

(add-hook
 'ranger-mode-hook
 (lambda ()
   (local-set-key (kbd "C-s C-w") 'other-window)
   (local-set-key (kbd "C-x C-s") (lambda () (interactive)))
   (local-set-key (kbd "C-s C-x") (lambda () (interactive)))))

(setq ranger-hide-cursor nil)
(setq ranger-modify-header nil)
(setq ranger-preview-file t)
(setq ranger-show-literal nil)
(setq ranger-parent-depth 0)
(setq ranger-width-preview 0.60)
(setq ranger-preview-delay 0.01)
