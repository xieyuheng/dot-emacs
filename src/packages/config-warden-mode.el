(add-to-list 'load-path "~/.emacs.d/deps/warden-mode")
(require 'warden-mode)

(add-to-list 'display-buffer-alist
             '("\\*warden:" display-buffer-same-window))
