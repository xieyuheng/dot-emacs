;;;; vterm

(add-to-list 'load-path "~/.emacs.d/deps/emacs-libvterm/")
(require 'vterm)

(setq vterm-set-bold-highbright t)

(set-face-attribute 'term-color-black          nil :foreground "#1e1e2e")
(set-face-attribute 'term-color-red            nil :foreground "#f38ba8")
(set-face-attribute 'term-color-green          nil :foreground "#a6e3a1")
(set-face-attribute 'term-color-yellow         nil :foreground "#f9e2af")
(set-face-attribute 'term-color-blue           nil :foreground "#89b4fa")
(set-face-attribute 'term-color-magenta        nil :foreground "#cba6f7")
(set-face-attribute 'term-color-cyan           nil :foreground "#94e2d5")
(set-face-attribute 'term-color-white          nil :foreground "#cdd6f4")
(set-face-attribute 'term-color-bright-black   nil :foreground "#585b70")
(set-face-attribute 'term-color-bright-red     nil :foreground "#f38ba8")
(set-face-attribute 'term-color-bright-green   nil :foreground "#a6e3a1")
(set-face-attribute 'term-color-bright-yellow  nil :foreground "#f9e2af")
(set-face-attribute 'term-color-bright-blue    nil :foreground "#89b4fa")
(set-face-attribute 'term-color-bright-magenta nil :foreground "#cba6f7")
(set-face-attribute 'term-color-bright-cyan    nil :foreground "#94e2d5")
(set-face-attribute 'term-color-bright-white   nil :foreground "#cdd6f4")
(set-face-attribute 'term                      nil :background "#1e1e2e"
                                                 :foreground "#cdd6f4")
