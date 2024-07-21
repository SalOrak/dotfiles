;; Modus-themes 
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
  ;; (load-theme 'modus-vivendi-tritanopia t)
  )

;; Ef-themes
(use-package ef-themes
  :ensure t
  :config
  (setq ef-themes-to-toggle '(ef-summer ef-symbiosis))
  ;; (mapc #'disable-theme custom-enabled-themes)
  ;; (ef-themes-select 'ef-summer)
  )

;; Doom-themes
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (doom-themes-org-config))
