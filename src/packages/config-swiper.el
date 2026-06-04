;;;; ivy

(add-to-list 'load-path "~/.emacs.d/deps/swiper/")
(require 'ivy)
(require 'swiper)
(require 'counsel)

(setq ivy-wrap t)

(ivy-mode 1)
