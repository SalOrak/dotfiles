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

(leader-spc-spc 'normal 'override
  "s" 'eval-last-sexp
  "g" 'general-describe-keybindings
  )

(defvar salorak/keymaps-list
  '(
    ;; consult
    ivy
    magit
    projectile
    org
    )
  )

;; Load plugin keymaps 
(salorak/load-plugins salorak/keymaps-list 'keymaps)

