;;;; tests

;; 中英等宽测试|
;; sdasddassaas|
;; iiiiiiiiiiii|
;; λλλλλλλλλλλλ|

;; 【“”""】【。.】【，,】【!！】【0 o】

;; [1i]
;; ~!@#$%^&*+=
;; 01234567890
;; -- ~~ __
;; ___---___---
;; >< <> -> =>
;; () [] {}
;; ;: "@" '@'
;; 1lJL qp QP o0O 8B 08
;; ,.  `'
;; <: :>
;; |- |--
;; <- ->
;; |- |--
;; |- |--

;;;; 黑

(set-fontset-font t 'han (font-spec :name "unifont" :size 54))
;; (set-fontset-font t 'han (font-spec :name "H-雲林呉竹体" :size 26))
;; (set-fontset-font t 'han (font-spec :name "Sarasa Mono SC" :size 50))
;; (set-fontset-font t 'han (font-spec :name "H-明蘭" :size 5044))
;; (set-fontset-font t 'han (font-spec :name "H-新雅蘭" :size 44))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK TC Thin" :size 44))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK TC Light" :size 44))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK TC DemiLight" :size 28))
;; (set-fontset-font t 'han (font-spec :name "Sarasa Mono SC" :size 44))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK SC" :size 50))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK TC Bold" :size 26))
;; (set-fontset-font t 'han (font-spec :name "Noto Sans CJK TC Black" :size 26))

;;;; 宋

;; (set-fontset-font t 'han (font-spec :name "H-秀月" :size 40))
;; (set-fontset-font t 'han (font-spec :name "臺灣新細明體" :size 26))
;; (set-fontset-font t 'han (font-spec :name "思源宋体" :size 50))

;;;; 楷

;; (set-fontset-font t 'han (font-spec :name "MS Song" :size 30))
;; (set-fontset-font t 'han (font-spec :name "H-宮書" :size 28))
;; (set-fontset-font t 'han (font-spec :name "H-宮書" :size 50))
;; (set-fontset-font t 'han (font-spec :name "霞鹜文楷" :size 50))

;;;; latin

(set-face-attribute 'default nil :family "unifont" :height 200)
(set-face-attribute 'fixed-pitch nil :family "unifont")
;; (set-face-attribute 'default nil :family "Input" :height 150)
;; (set-face-attribute 'default nil :family "Monaco" :height 170)
;; (set-face-attribute 'default nil :family "minecraft" :height 180)
;; (set-face-attribute 'default nil :family "Monoid" :height 140)
;; (set-face-attribute 'default nil :family "Monoid Nerd Font" :height 140)
;; (set-face-attribute 'default nil :family "Terminus (TTF)" :height 190)
;; (set-face-attribute 'default nil :family "xos4 Terminus" :height 200)
;; (set-face-attribute 'default nil :family "PragmataPro Mono" :height 200)
;; (set-face-attribute 'default nil :family "monofur" :height 160)
;; (set-face-attribute 'default nil :family "Monofur Nerd Font" :height 160)
;; (set-face-attribute 'default nil :family "monaco" :height 155)
;; (set-face-attribute 'default nil :family "Fixedsys Excelsior 3.01" :height 190)
;; (set-face-attribute 'default nil :family "Fira Code" :height 150)
;; (set-face-attribute 'default nil :family "Fira Mono" :height 190)
;; (set-face-attribute 'default nil :family "Sarasa Mono SC" :height 190)
;; (set-face-attribute 'default nil :family "Source Code Pro" :height 180)
;; (set-face-attribute 'default nil :family "mononoki" :height 180)
;; (set-face-attribute 'default nil :family "Noto Mono" :height 180)

;;;; symbol

(set-fontset-font t 'symbol (font-spec :name "unifont"))
;; (set-fontset-font t 'symbol (font-spec :name "Noto Mono"))
;; (set-fontset-font t 'symbol (font-spec :name "Sarasa Mono SC"))
;; (set-fontset-font t 'symbol (font-spec :name "Fira Code"))
;; (set-fontset-font t 'symbol (font-spec :name "Noto Emoji"))
