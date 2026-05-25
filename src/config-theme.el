;;;; molokai-theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/molokai-theme/")
;; (load-theme 'molokai t)

;;;; standard-themes

(add-to-list 'load-path (expand-file-name "themes/standard-themes" user-emacs-directory))

;; ---- standard-themes (暗色) ----

(require 'standard-dark-theme)         (load-theme 'standard-dark t)         ;; 模拟未定制暗色 Emacs，但更一致
;; (require 'standard-dark-tinted-theme)  (load-theme 'standard-dark-tinted t)  ;; 暗色夜空变体
;; (require 'standard-wombat-theme)       (load-theme 'standard-wombat t)       ;; 模拟内置 wombat，但更一致

;; ---- standard-themes (亮色) ----

;; (require 'standard-light-theme)         (load-theme 'standard-light t)         ;; 模拟未定制亮色 Emacs，但更一致
;; (require 'standard-light-tinted-theme)  (load-theme 'standard-light-tinted t)  ;; 亮色变体
;; (require 'standard-adwaita-theme)       (load-theme 'standard-adwaita t)       ;; 模拟内置 adwaita，但更一致

;;;; doric-themes

(add-to-list 'load-path (expand-file-name "themes/doric-themes" user-emacs-directory))

;; ---- doric-themes (暗色) ----

;; (require 'doric-dark-theme)     (load-theme 'doric-dark t)     ;; 暗色背景 + 冷色
;; (require 'doric-fire-theme)     (load-theme 'doric-fire t)     ;; 火焰橙/红
;; (require 'doric-magma-theme)    (load-theme 'doric-magma t)    ;; 暖棕/红
;; (require 'doric-obsidian-theme) (load-theme 'doric-obsidian t) ;; 火山玻璃 / 暗紫
;; (require 'doric-oak-theme)      (load-theme 'doric-oak t)      ;; 绿棕 / 森林
;; (require 'doric-pine-theme)     (load-theme 'doric-pine t)     ;; 橄榄 / 卡其
;; (require 'doric-walnut-theme)   (load-theme 'doric-walnut t)   ;; 棕 / 木色
;; (require 'doric-copper-theme)   (load-theme 'doric-copper t)   ;; 金属棕/橙

;; ---- doric-themes (亮色) ----

;; (require 'doric-light-theme)   (load-theme 'doric-light t)   ;; 亮色背景 + 冷色
;; (require 'doric-almond-theme)  (load-theme 'doric-almond t)  ;; 柔和黄/棕粉彩
;; (require 'doric-beach-theme)   (load-theme 'doric-beach t)   ;; 沙色
;; (require 'doric-cherry-theme)  (load-theme 'doric-cherry t)  ;; 粉红
;; (require 'doric-coral-theme)   (load-theme 'doric-coral t)   ;; 珊瑚/桃色
;; (require 'doric-earth-theme)   (load-theme 'doric-earth t)   ;; 绿棕粉彩
;; (require 'doric-jade-theme)    (load-theme 'doric-jade t)    ;; 绿色调
;; (require 'doric-marble-theme)  (load-theme 'doric-marble t)  ;; 灰白 / "黑白"
;; (require 'doric-mermaid-theme) (load-theme 'doric-mermaid t) ;; 青蓝
;; (require 'doric-plum-theme)    (load-theme 'doric-plum t)    ;; 品红/紫
;; (require 'doric-siren-theme)   (load-theme 'doric-siren t)   ;; 红/深红
;; (require 'doric-valley-theme)  (load-theme 'doric-valley t)  ;; 深绿
;; (require 'doric-water-theme)   (load-theme 'doric-water t)   ;; 亮青蓝
;; (require 'doric-wind-theme)    (load-theme 'doric-wind t)    ;; 淡蓝 / 天空色

;;;; modus-themes

(add-to-list 'load-path (expand-file-name "themes/modus-themes" user-emacs-directory))

;; ---- modus-themes (暗色) ----

;; (require 'modus-vivendi-theme)              (load-theme 'modus-vivendi t)              ;; 暗色，高对比 (WCAG AAA)
;; (require 'modus-vivendi-tinted-theme)       (load-theme 'modus-vivendi-tinted t)       ;; 暗色 + 轻微色调
;; (require 'modus-vivendi-deuteranopia-theme) (load-theme 'modus-vivendi-deuteranopia t) ;; 暗色，红绿色盲友好
;; (require 'modus-vivendi-tritanopia-theme)   (load-theme 'modus-vivendi-tritanopia t)   ;; 暗色，蓝黄色盲友好

;; ---- modus-themes (亮色) ----

;; (require 'modus-operandi-theme)              (load-theme 'modus-operandi t)              ;; 亮色，高对比 (WCAG AAA)
;; (require 'modus-operandi-tinted-theme)       (load-theme 'modus-operandi-tinted t)       ;; 亮色 + 轻微色调
;; (require 'modus-operandi-deuteranopia-theme) (load-theme 'modus-operandi-deuteranopia t) ;; 亮色，红绿色盲友好
;; (require 'modus-operandi-tritanopia-theme)   (load-theme 'modus-operandi-tritanopia t)   ;; 亮色，蓝黄色盲友好

;;;; ef-themes

(add-to-list 'load-path (expand-file-name "themes/ef-themes" user-emacs-directory))

;; ---- ef-themes (暗色) ----

;; (require 'ef-atlantis-theme)          (load-theme 'ef-atlantis t)          ;; 暗色，水色系
;; (require 'ef-autumn-theme)            (load-theme 'ef-autumn t)            ;; 暗棕黑，暖色（红/黄/绿/青）
;; (require 'ef-bio-theme)               (load-theme 'ef-bio t)               ;; 暗绿黑，绿/青/蓝/紫
;; (require 'ef-cherie-theme)            (load-theme 'ef-cherie t)            ;; 暗紫黑，暖色（粉/品红/金）
;; (require 'ef-dark-theme)              (load-theme 'ef-dark t)              ;; 暗色，蓝/品红/青/紫
;; (require 'ef-deuteranopia-dark-theme) (load-theme 'ef-deuteranopia-dark t) ;; 暗色，红绿色盲友好
;; (require 'ef-dream-theme)             (load-theme 'ef-dream t)             ;; 暗紫灰，金+柔和色
;; (require 'ef-duo-dark-theme)          (load-theme 'ef-duo-dark t)          ;; 暗色，蓝橙双色
;; (require 'ef-elea-dark-theme)         (load-theme 'ef-elea-dark t)         ;; 暗绿，棕/品红/绿
;; (require 'ef-fig-theme)               (load-theme 'ef-fig t)               ;; 暗色，暖绿/黄/品红
;; (require 'ef-maris-dark-theme)        (load-theme 'ef-maris-dark t)        ;; 暗海洋，蓝/青/绿
;; (require 'ef-melissa-dark-theme)      (load-theme 'ef-melissa-dark t)      ;; 暗蜜色，暖色（黄/红/绿/青）
;; (require 'ef-night-theme)             (load-theme 'ef-night t)             ;; 暗天蓝，绿/蓝/紫
;; (require 'ef-owl-theme)               (load-theme 'ef-owl t)               ;; 暗灰，蓝/青/品红，低饱和
;; (require 'ef-rosa-theme)              (load-theme 'ef-rosa t)              ;; 暗红木，品红+绿
;; (require 'ef-symbiosis-theme)         (load-theme 'ef-symbiosis t)         ;; 暗棕黑，蓝/绿/青/金
;; (require 'ef-trio-dark-theme)         (load-theme 'ef-trio-dark t)         ;; 暗紫灰，品红/蓝/青
;; (require 'ef-tritanopia-dark-theme)   (load-theme 'ef-tritanopia-dark t)   ;; 暗色，蓝黄色盲友好
;; (require 'ef-winter-theme)            (load-theme 'ef-winter t)            ;; 暗紫黑，品红/紫/驼/青

;; ---- ef-themes (亮色) ----

;; (require 'ef-arbutus-theme)           (load-theme 'ef-arbutus t)           ;; 亮粉，红+绿
;; (require 'ef-arcadia-theme)           (load-theme 'ef-arcadia t)           ;; 亮色，翠绿色系
;; (require 'ef-cyprus-theme)            (load-theme 'ef-cyprus t)            ;; 亮赭石，绿/黄/青/红
;; (require 'ef-day-theme)               (load-theme 'ef-day t)               ;; 亮沙色，暖调（黄/红/绿/紫）
;; (require 'ef-deuteranopia-light-theme) (load-theme 'ef-deuteranopia-light t) ;; 亮色，红绿色盲友好
;; (require 'ef-duo-light-theme)          (load-theme 'ef-duo-light t)          ;; 亮色，蓝黄双色
;; (require 'ef-eagle-theme)              (load-theme 'ef-eagle t)              ;; 亮米色，棕/红，低饱和
;; (require 'ef-elea-light-theme)         (load-theme 'ef-elea-light t)         ;; 亮绿，棕/品红/绿
;; (require 'ef-frost-theme)              (load-theme 'ef-frost t)              ;; 亮冷色，蓝/青/紫
;; (require 'ef-kassio-theme)             (load-theme 'ef-kassio t)             ;; 亮灰，蓝/红/品红/大地色
;; (require 'ef-light-theme)              (load-theme 'ef-light t)              ;; 亮色，蓝/品红/青/紫
;; (require 'ef-maris-light-theme)        (load-theme 'ef-maris-light t)        ;; 亮海洋，蓝/青/绿
;; (require 'ef-melissa-light-theme)      (load-theme 'ef-melissa-light t)      ;; 亮蜜色，暖色（黄/红/绿/青）
;; (require 'ef-orange-theme)             (load-theme 'ef-orange t)             ;; 亮色，橙/黄/绿
;; (require 'ef-reverie-theme)            (load-theme 'ef-reverie t)            ;; 亮薰衣草，金+柔和色
;; (require 'ef-spring-theme)             (load-theme 'ef-spring t)             ;; 亮花系，冷调（绿/青/红）
;; (require 'ef-summer-theme)             (load-theme 'ef-summer t)             ;; 亮暖粉，品红/紫/金/青
;; (require 'ef-trio-light-theme)         (load-theme 'ef-trio-light t)         ;; 亮紫灰，品红/蓝/青
;; (require 'ef-tritanopia-light-theme)   (load-theme 'ef-tritanopia-light t)   ;; 亮色，蓝黄色盲友好
