;;; Colorscheme (color-related)

;; Set fonts
(add-to-list 'default-frame-alist '(font . "Meslo LGM Nerd Font"))

;; Relative number font to pitched-fonts
(set-face-attribute 'line-number nil :family "Meslo LGM Nerd Font")
(set-face-attribute 'line-number-current-line nil :family "Meslo LGM Nerd Font")

; Transparent background
(add-to-list 'default-frame-alist '(alpha-background . 98)) 

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)
  )
