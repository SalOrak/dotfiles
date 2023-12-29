;; Core keymaps

;; Global keymaps
(leader-spc 'normal 'override
  "o" 'other-window
  "fe" 'find-file
  "fp" 'find-file-at-point
  "pv" 'dired
  "wv" 'split-window-right
  "wh" 'split-window-vertically
  "wo" 'delete-other-windows ;; Delete other windows
  "wq" 'delete-window ;; Quit window "wd" 'kill-buffer-and-window ;; Delete window & buffer 
  )

;; Load plugin specific keymaps
;; (load "~/.config/emacs/keymaps/consult.el")
(load "~/.config/emacs/keymaps/ivy.el")
(load "~/.config/emacs/keymaps/magit.el")
(load "~/.config/emacs/keymaps/projectile.el")

