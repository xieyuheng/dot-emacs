(setq c-basic-offset 4)
(setq c-default-style "k&r")

;; (setq c-default-style "stroustrup")
;; (setq c-default-style "whitesmith")
;; (setq c-default-style "ellemtel")
;; (setq c-default-style "linux")

(add-hook
 'c-mode-hook
 (lambda ()
   ;; (setq comment-style 'extra)
   (setq comment-start "//")
   (setq comment-end "")))
