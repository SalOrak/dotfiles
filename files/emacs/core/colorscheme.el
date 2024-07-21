;;; Colorscheme (color-related)

;; Set fonts
;; (add-to-list 'initial-frame-alist '(font . "Meslo LGM Nerd Font Mono-14"))
;; (add-to-list 'default-frame-alist '(font . "Meslo LGM Nerd Font Mono-14"))
(add-to-list 'initial-frame-alist '(font . "Iosevka Nerd Font-14"))
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-14"))

;; Relative number font to pitched-fonts
(set-face-attribute 'line-number nil :family "Meslo LGM Nerd Font Mono")
(set-face-attribute 'line-number-current-line nil :family "Meslo LGM Nerd Font Mono")

; Transparent background
(add-to-list 'default-frame-alist '(alpha-background . 94)) 

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


;; solaire-mode is an aesthetic plugin designed to visually distinguish
;;  "real" buffers (i.e. file-visiting code buffers where you do most of your work)
;;  from "unreal" buffers (like popups, sidebars, log buffers, terminals, etc)
;;  by giving the latter a slightly different -- often darker -- background
(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))


;; ANSI Colors in compilation (built-in)
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

;; ---------------------------
;; THEME SELECTION
;; ---------------------------

(progn
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'doom-one t)
 )
