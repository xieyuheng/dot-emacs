(add-to-list 'load-path "~/.emacs.d/region-state/")
(require 'region-state)

(region-state-mode)
(setq region-state-display-place 'echo-area)
;; (setq region-state-display-place 'header-line)
;; (setq region-state-display-place 'mode-line)
