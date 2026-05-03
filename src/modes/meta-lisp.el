;;; meta-lisp.el --- Major mode for editing meta-lisp files

;;; Commentary:
;; A simple major mode for meta-lisp, providing syntax highlighting
;; for keywords, literals, and strings.
;;
;; Features:
;; - Syntax highlighting for all meta-lisp keywords
;; - Support for @literals and :keywords
;; - Inherits from lisp-mode (parenthesis matching, indentation)

;;; Code:

(require 'lisp-mode)

(defgroup meta-lisp nil
  "meta-lisp mode customization."
  :group 'lisp)

;;;---------------------------------------------------------------------------
;;; Keyword Definitions (grouped by category for clarity)
;;;---------------------------------------------------------------------------

(defvar meta-lisp--definition-keywords
  '("define" "define-test" "define-type" "define-data" "define-interface")
  "Keywords for defining functions, variables, types, and data structures.")

(defvar meta-lisp--type-declaration-keywords
  '("claim" "admit" "exempt" "private")
  "Keywords for type declarations and visibility control.")

(defvar meta-lisp--primitive-keywords
  '("declare-primitive-function" "declare-primitive-variable")
  "Keywords for declaring primitive functions and variables.")

(defvar meta-lisp--control-flow-keywords
  '("if" "when" "unless" "cond" "and" "or" "match" "match-many")
  "Keywords for control flow and conditional expressions.")

(defvar meta-lisp--binding-keywords
  '("let" "let*" "begin" "lambda" "polymorphic")
  "Keywords for binding, assignment, and anonymous functions.")

(defvar meta-lisp--module-keywords
  '("module" "type-error-module" "import" "import-as" "import-all")
  "Keywords for module declaration and import.")

(defvar meta-lisp--record-keywords
  '("the" "extend" "extend-interface" "update" "update!")
  "Keywords for working with records and interfaces.")

(defvar meta-lisp--type-constructor-keywords
  '("->" "interface")
  "Keywords for constructing types.")

;;;---------------------------------------------------------------------------
;;; Syntax Highlighting
;;;---------------------------------------------------------------------------

(defvar meta-lisp--font-lock-keywords
  `(
    ;; Definition keywords - font-lock-keyword-face
    (,(regexp-opt meta-lisp--definition-keywords 'words)
     . font-lock-keyword-face)

    ;; Type declaration keywords - font-lock-type-face
    (,(regexp-opt meta-lisp--type-declaration-keywords 'words)
     . font-lock-type-face)

    ;; Primitive declaration keywords - font-lock-builtin-face
    (,(regexp-opt meta-lisp--primitive-keywords 'words)
     . font-lock-builtin-face)

    ;; Control flow keywords - font-lock-keyword-face
    (,(regexp-opt meta-lisp--control-flow-keywords 'words)
     . font-lock-keyword-face)

    ;; Binding keywords - font-lock-keyword-face
    (,(regexp-opt meta-lisp--binding-keywords 'words)
     . font-lock-keyword-face)

    ;; Module keywords - font-lock-builtin-face
    (,(regexp-opt meta-lisp--module-keywords 'words)
     . font-lock-builtin-face)

    ;; Record/Interface keywords - font-lock-keyword-face
    (,(regexp-opt meta-lisp--record-keywords 'words)
     . font-lock-keyword-face)

    ;; Type constructor keywords - font-lock-type-face
    (,(regexp-opt meta-lisp--type-constructor-keywords 'words)
     . font-lock-type-face)

    ;; Type names ending with -t (int-t, float-t, list-t, etc.)
    ("[a-zA-Z0-9]+-t\\>"
     . font-lock-type-face)

    ;; Literal prefixes: @list, @record, @set, @hash
    ("@[a-z]+\\_>"
     . font-lock-constant-face)

    ;; Keywords: :foo
    (":[a-zA-Z0-9\\-]+"
     . font-lock-constant-face)
    )
  "Syntax highlighting for meta-lisp mode.")

;;;---------------------------------------------------------------------------
;;; Mode Definition
;;;---------------------------------------------------------------------------

;;;###autoload
(define-derived-mode meta-lisp-mode lisp-mode "meta-lisp"
  "Major mode for editing meta-lisp files.
\{meta-lisp-mode-map}"

  ;; Syntax highlighting
  (setq font-lock-defaults '(meta-lisp--font-lock-keywords))

  ;; Comment style (same as lisp)
  (setq comment-start ";")
  (setq comment-end "")

  ;; Indentation (inherit from lisp-mode)
  (setq lisp-body-indent 2)
  (setq lisp-indent-offset 2)

  ;; Treat [], {}, and () as parentheses for bracket matching
  ;; This enables show-paren-mode and electric-pair-mode for all bracket types
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){"))

;;; File association
(add-to-list 'auto-mode-alist '("\\.meta\\'" . meta-lisp-mode))

(provide 'meta-lisp)

;;; meta-lisp.el ends here
