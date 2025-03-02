;;; mini-paredit.el

;; It turns out that a lot of the paredit key bindings work as
;; expected in non-lisp buffers, since many major modes provide
;; reasonable sexp-oriented navigation.

;; This library, then, provides a minor mode which enables a subset
;; of the `paredit' library's editing commands in non-lisp buffers.

;; Usage:
;;
;; (add-hook 'prog-mode-hook 'mini-paredit-mode)

;;; Code:

(require 'paredit)

(defvar mini-paredit-mode-map
  (let ((m (make-sparse-keymap)))

    ;; insert
    (define-key m (kbd "(") 'paredit-open-round)
    (define-key m (kbd ")") 'paredit-close-round)
    
    (define-key m (kbd "M-(") 'paredit-wrap-round)
    (define-key m (kbd "M-[") 'paredit-wrap-square)
    (define-key m (kbd "M-{") 'paredit-wrap-curly)

    (define-key m (kbd "M-\"") 'paredit-meta-doublequote)

    
    ;; tun-tu :吞吐
    (define-key m (kbd "<C-right>") 'paredit-forward-slurp-sexp)
    (define-key m (kbd "<C-left>") 'paredit-forward-barf-sexp)
    
    
    ;; lie-sheng :裂升
    (define-key m (kbd "M-s") 'paredit-splice-sexp)
    (define-key m (kbd "M-r") 'paredit-raise-sexp)
    (define-key m (kbd "<C-M-right>") 'paredit-backward-barf-sexp)
    (define-key m (kbd "<C-M-left>") 'paredit-backward-slurp-sexp)

    ;; fen-he :分合
    (define-key m (kbd "M-S") 'paredit-split-sexp)
    (define-key m (kbd "M-J") 'paredit-join-sexp)
    m)
  "Keymap for `mini-paredit-mode'.")

;;;###autoload
(define-minor-mode mini-paredit-mode
  "mini-paredit-mode"
  nil
  " Par-"
  mini-paredit-mode-map)

(defun turn-off-mini-paredit-mode ()
  "Disable `mini-paredit-mode'."
  (mini-paredit-mode 0))

;; Disable paredit-everywhere when full paredit is enabled
(add-hook 'paredit-mode-hook 'turn-off-mini-paredit-mode)



(provide 'mini-paredit)

;;; mini-paredit.el ends here
