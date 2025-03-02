(defmacro make-syntaxes (name &rest lis)
  (list 'progn ;; need to control eva order
        `(setq ,name
               (make-char-table 'syntax-table (string-to-syntax "w")))
        (cons 'progn
              (mapcar (lambda (char-and-newentry)
                        (append (list 'modify-syntax-entry)
                                char-and-newentry
                                (list name)))
                      lis))))

(make-syntaxes
 parentheses-syntax-table
 ;; note that, if modify one syntax entry twice
 ;; the second will shadow the first
 ;; whitespace characters:
 (   '(0 . 32)    "-"  )
 (      127       "-"  )
 ;; open/close delimiter:
 ;; the following functions need this:
 ;; ``forward-sexp'' ``backward-sexp''
 ;; ``mark-sexp'' and so on ...
 (  ?\(    "("  )
 (  ?\)    ")"  )
 (  ?\[    "("  )
 (  ?\]    ")"  )
 (  ?\{    "("  )
 (  ?\}    ")"  ))

(defun change-parentheses ()
  (interactive)
  (cond ((looking-at "\(")
         (message "( ) --> [ ]")
         (let ()
           (delete-char 1)
           (insert "[")
           (backward-char 1)
           (with-syntax-table parentheses-syntax-table
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert "]")
           (with-syntax-table parentheses-syntax-table
             (forward-sexp -1))))
        ((looking-at "\\[")
         (message "[ ] --> { }")
         (let ()
           (delete-char 1)
           (insert "{")
           (backward-char 1)
           (with-syntax-table parentheses-syntax-table
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert "}")
           (with-syntax-table parentheses-syntax-table
             (forward-sexp -1))))
        ((looking-at "\{")
         (message "{ } --> ( )")
         (let ()
           (delete-char 1)
           (insert "(")
           (backward-char 1)
           (with-syntax-table parentheses-syntax-table
             (forward-sexp 1)))
         (let ()
           (delete-char -1)
           (insert ")")
           (with-syntax-table parentheses-syntax-table
             (forward-sexp -1))))
        (t ;;else
         (message "change-parentheses have nothing to do here !"))))

(provide 'change-parentheses)
