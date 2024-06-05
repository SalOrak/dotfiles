;;; Colorscheme (color-related)

;; Set fonts
(add-to-list 'initial-frame-alist '(font . "Meslo LGM Nerd Font Mono-14"))
(add-to-list 'default-frame-alist '(font . "Meslo LGM Nerd Font Mono-14"))

;; Relative number font to pitched-fonts
(set-face-attribute 'line-number nil :family "Meslo LGM Nerd Font Mono")
(set-face-attribute 'line-number-current-line nil :family "Meslo LGM Nerd Font Mono")

; Transparent background
(add-to-list 'default-frame-alist '(alpha-background . 94)) 

(use-package modus-themes
  :disabled
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

(use-package ef-themes
  :disabled
  :ensure t
  :config
  (setq ef-themes-to-toggle '(ef-summer ef-symbiosis))
  (mapc #'disable-theme custom-enabled-themes)
  (ef-themes-select 'ef-summer))



(use-package gruvbox-theme
  :ensure t
  :config
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'gruvbox-light-medium t))

(use-package f
  :ensure t)

;; Install nerd icons if they are not present in the system
(use-package nerd-icons
  :requires (f)
  :ensure t
  :config
  (let ((path
         (cond
          ((member system-type '(darwin))
           "~/Library/Fonts/NFM.ttf")
          ((member system-type '(gnu gnu/linux))
           "~/.local/share/fonts/NFM.ttf"))))
    (when (not (f-file-p path))
      (nerd-icons-install-fonts t))))

;; ANSI Colors in compilation (built-in)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
