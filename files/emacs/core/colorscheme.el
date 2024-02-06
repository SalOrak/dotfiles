;;; Colorscheme (color-related)

;; Set fonts
(add-to-list 'default-frame-alist '(font . "Meslo LGM Nerd Font"))

;; Relative number font to pitched-fonts
(set-face-attribute 'line-number nil :family "Meslo LGM Nerd Font")
(set-face-attribute 'line-number-current-line nil :family "Meslo LGM Nerd Font")

; Transparent background
;; (add-to-list 'default-frame-alist '(alpha-background . 99)) 

(use-package modus-themes
  :ensure t
  :config
  ;; Customizations
  (setq modus-themes-bold-constructs nil)
  (setq modus-themes-prompts '(bold ))
  (setq modus-themes-org-blocks 'tinted-background)
  (setq modus-themes-completions  
	(quote ((matches . (extrabold underline))
		(selection . (semibold underline)))))

  (setq modus-themes-common-palette-overrides
	'(
	  ;; Modeline Active
	  (fg-mode-line-active yellow-faint)
	  (bg-mode-line-active bg-main)
	  (border-mode-line-active bg-yellow-intense)

	  ;; Modeline (save)
	  (modeline-err red-intense)

	  ;; Prompt
	  (fg-prompt yellow-faint)

	  ;; Region preserve text colors
	  (bg-region bg-sage)
	  (fg-region unspecified)

	  ;; Relative numbers -- Gold Like
	  (fg-line-number-active yellow-faint)
	  (bg-line-number-active unspecified)
	  (bg-line-number-inactive unspecified)

	  ;; Comment
	  (comment yellow-warmer)
	  ))

  ;; Palette overrides
  (load-theme 'modus-vivendi-tritanopia t)
  )
