;; UI mods

;; For OS X only. Sets Command key to Meta key.
(when (eq system-type 'darwin)
 (setq mac-command-key-is-meta nil)
 (setq mac-option-key-is-meta t)
 (setq mac-command-modifier 'super)
 (setq mac-option-modifier 'meta)
)

;; Confirm killing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Short version of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable backup files
(setq make-backup-files nil)

;; Change built-in visual modes
(menu-bar-mode 0)
(when (eq system-type 'darwin)
  (menu-bar-mode t)
)
(tool-bar-mode 0)
(column-number-mode 1)

;; Line Numbers 
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type (quote relative))
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-start t)
(setq truncate-lines nil)

;; Remove scroll bar
(scroll-bar-mode 0)

;; Turn off alarms, no more beeepppssss 
(setq ring-bell-function 'ignore)

;; Treat manual buffer switching the same as programmatic switching.
(setq switch-to-buffer-obey-display-actions t)
