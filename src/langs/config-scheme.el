(require 'cmuscheme) ;; for `switch-to-scheme`

(setq scheme-program-name "scheme")
(setq auto-mode-alist (cons `("\\.sld$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.ss$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.sls$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.mu$" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.lisp" . scheme-mode) auto-mode-alist))
(setq auto-mode-alist (cons `("\\.pie$" . scheme-mode) auto-mode-alist))

(defun switch-to-buffer-*scheme* ()
  (interactive)
  (switch-to-scheme 1) ;; (switch-to-buffer "*scheme*")
  (local-set-key (kbd "C-s C-d") 'previous-buffer))

(global-set-key (kbd "C-s C-d") 'switch-to-buffer-*scheme*)

(defun split-window-with-named-buffer (buffer-name-string)
  (interactive)
  (cond
   ((= 1 (count-windows))
    (progn
      ;; 下面这两个的组合总能行为正确
      (split-window-vertically (floor (* 0.68 (window-height))))
      (other-window 1)
      (switch-to-buffer buffer-name-string)
      (other-window -1)))

   ;; 只允许出现一个 scheme 窗口
   ;; 因此当发现有别的窗口的时候就在那个窗口中打开所需要的 buffer
   ((not (cl-find buffer-name-string
                  (mapcar (lambda (w) (buffer-name (window-buffer w)))
                          (window-list))
                  :test 'equal))
    (progn
      (other-window 1)
      (switch-to-buffer buffer-name-string)
      (other-window -1)))))

(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-send-last-sexp)
  (split-window-with-named-buffer "*scheme*"))

(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-send-definition)
  (split-window-with-named-buffer "*scheme*"))

(add-hook
 'inferior-scheme-mode-hook
 (lambda ()
   (local-set-key (kbd "C-c C-k")
                  (lambda ()
                    (interactive)
                    (kill-buffer)
                    (run-scheme scheme-program-name)))))

(defun scheme-easy-to-eval ()
  (interactive)
  (if (>= (+ 1 (point))
          (point-max))
      (message "C-<tab> : last sexp is evaled")
    (let ()
      (forward-sexp)
      (scheme-send-last-sexp-split-window))))

(add-hook
 'scheme-mode-hook
 (lambda ()
   (local-set-key (kbd "C-x C-e") 'scheme-send-last-sexp-split-window)
   (local-set-key (kbd "C-c C-e") 'scheme-send-definition-split-window)
   (local-set-key (kbd "C-<tab>") 'scheme-easy-to-eval)
   (local-set-key (kbd "{")
                  (lambda () (interactive) (insert "{}") (backward-char 1)))
   (local-set-key (kbd "}") 'up-list)))

;;;; scheme-add-keywords

;; scheme-mode 中原本的实现不是如此

(defun scheme-add-keywords (face-name keyword-rules)
  (let* ((keyword-list (mapcar #'(lambda (x)
                                   (symbol-name (cdr x)))
                               keyword-rules))
         (keyword-regexp (concat "(\\("
                                 (regexp-opt keyword-list)
                                 "\\)[ \n]")))
    (font-lock-add-keywords 'scheme-mode
                            `((,keyword-regexp 1 ',face-name))))
  (mapc #'(lambda (x)
            (put (cdr x)
                 'scheme-indent-function
                 (car x)))
        keyword-rules))

;; 前面的数字被认为是参数项的个数
;; 参数项完全换行时强缩进 其他项弱缩进
;; 非语法关键词 所有项在完全换行时都不缩进

(scheme-add-keywords
 'font-lock-keyword-face
 '(
   ;; inet-lisp
   (1 . define-node)
   (1 . define-rule)
   (1 . define-rule*)
   (0 . assign)
   (0 . lend)
   (0 . connect)

   ;; the little prover
   (2 . dethm)
   (1 . J-Bob/step)
   (1 . J-Bob/prove)
   (1 . J-Bob/define)

   (0 . put)
   (0 . put!)

   ;; 下面 scheme 中需要高亮的词
   (0 . set!)
   (0 . set-car!)
   (0 . set-cdr!)
   (0 . vector-set!)
   (1 . quote)
   (1 . quasiquote)
   (1 . unquote)
   (1 . escape)
   (1 . if)
   (1 . apply)
   (1 . letrec*)
   (1 . while)

   ;; 来自扩展的
   (1 . letcc)
   (1 . pmatch)
   (2 . pmatch-who)
   (0 . guard)
   (0 . add-to-list!)
   (0 . add-to-list-end!)
   (0 . append!)

   ;; minikanren
   (2 . ==)
   (1 . fresh)
   (0 . conde)
   (0 . condi)
   (1 . run*)
   (1 . ando+)
   (1 . oro+)
   (0 . ando)
   (0 . oro)
   (0 . trunk)
   (1 . case-inf)

   (1 . define-primitive)
   (1 . define-lazy)

   (1 . class)
   (2 . class*)
   (1 . interface)
   (1 . new)
   (1 . send)
   (0 . :)
   (1 . ::)
   (1 . super)

   (1 . match)
   (1 . match*)

   (2 . syntax-case)
   (1 . syntax-parse)

   (1 . type)
   (3 . data)
   (3 . codata)
   (0 . export)
   (1 . import)
   (1 . import-only)
   (1 . import-all)
   (1 . import-as)
   (1 . include)
   (1 . include-all)
   (1 . include-only)
   (1 . include-except)
   (1 . include-as)
   (1 . require)
   (0 . example)
   (0 . effect)

   (1 . equal-t)

   (2 . define-function)
   (2 . define-variable)
   (2 . define-primitive-function)

   (0 . ~)
   ;; (0 . +)
   (0 . /)
   (0 . \?)
   (0 . *)
   (0 . !)
   (0 . @)
   (0 . $)
   (0 . \#)
   (0 . &)
   (0 . ^)
   (0 . -)
   (0 . %)
   ;; (0 . =)

   (0 . <)
   (0 . >)

   (0 . =>)
   (0 . =<)
   (0 . <=)
   (0 . >=)

   (1 . define-type)
   (1 . define-record)
   (1 . define-data)
   (1 . define-object)
   (2 . datatype)
   (2 . define-datatype)
   (1 . define-function)

   (1 . map!)

   (0 . var)
   (0 . set)
   (1 . get)

   (0 . tail-call)
   (0 . string)

   (2 . declare)
   (0 . run)

   (2 . define-class)

   ;; pie
   (1 . which-Nat)
   (1 . iter-Nat)
   (1 . rec-Nat)
   (1 . ind-Nat)

   (1 . which-List)
   (1 . iter-List)
   (1 . rec-List)
   (1 . ind-List)

   (2 . ind-Vec)

   (0 . =)
   (1 . the)
   (1 . check-same)
   (1 . check)
   (1 . claim)
   (1 . pi)
   (1 . pi*)
   (1 . iota)
   (1 . ι)
   (1 . sigma)
   (1 . lambda*)
   (1 . lambda/implicit)
   (1 . forall)
   (1 . exists)
   (1 . same)
   (1 . cong)
   (1 . replace)
   (1 . implicit)

   (0 . assert)
   (0 . assert-not)

   (0 . assert-equal)
   (0 . assert-not-equal)

   (0 . assert-type-equal)
   (0 . assert-not-type-equal)

   (0 . assert-same)
   (0 . assert-not-same)

   (0 . assert-subtype)
   (0 . assert-not-subtype)

   (0 . assert-the)

   (1 . induction)
   (1 . recursion)

   (0 . thunk)
   (0 . lazy)
   (1 . lambda-lazy)
   (1 . is)
   (1 . eval)
   (1 . pipe)
   (0 . >>)
   (0 . ->)
   (0 . *->)
   (0 . compose)
   (0 . choice)
   (0 . do)
   (1 . given)
   (1 . nu)
   (1 . mu)
   (0 . tau)
   (0 . tau*)
   (0 . tael)
   (0 . struct)
   (0 . union)
   (0 . inter)
   (0 . enum)
   (1 . fresh-type)
   (0 . gon)
   (0 . path)
   (0 . hedron)
   (0 . shell)
   (0 . choron)
   (0 . gon*)
   (0 . path*)
   (0 . hedron*)
   (0 . shell*)
   (0 . choron*)
   (1 . define-space)

   (1 . @quote)
   (0 . @comment)
   (1 . @unquote)
   (1 . @quasiquote)
   (0 . @tael)
   (0 . @list)
   (0 . @record)
   (0 . @set)
   (0 . @hash)
   (1 . @pattern)
   (1 . @escape)

   (1 . quote)
   (0 . comment)
   (1 . unquote)
   (1 . quasiquote)
   (0 . tael)
   (0 . list)
   (0 . record)
   (0 . set)
   (0 . hash)
   (1 . pattern)
   (1 . escape)

   (1 . polymorphic)
   (1 . specific)

   (1 . module)
   (1 . label)
   (1 . block)
   (1 . return)
   (1 . goto)
   (1 . branch)

   (1 . propagator)
   (1 . define-propagator)
   (1 . define-struct)

   (2 . let-one)
   (2 . let1)))
