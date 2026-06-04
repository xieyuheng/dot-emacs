;;;; ivy

(add-to-list 'load-path "~/.emacs.d/deps/swiper/")
(require 'ivy)
(require 'swiper)
(require 'counsel)

(setq ivy-wrap t)

(global-set-key (kbd "C-x C-f") 'counsel-git)
(global-set-key (kbd "C-x C-g") 'counsel-git-grep)

(ivy-mode 1)
