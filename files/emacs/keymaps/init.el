;; Core keymaps

;; Global keymaps
(leader-spc 'normal 'override
  "o" 'other-window
  "cc" 'compile
  "cr" 'recompile
  "cg" 'compilation-goto-in-progress-buffer
  "fe" 'find-file
  "fp" 'find-file-at-point
  "bl" 'buffer-menu
  "dd" 'dired
  "dd" 'dired-other-window
  "wv" 'split-window-right
  "wh" 'split-window-vertically
  "wS" 'evil-window-move-far-right ;; Move window to right
  "wH" 'evil-window-move-far-left ;; Move window to left
  "wo" 'delete-other-windows ;; Delete other windows
  "wq" 'delete-window ;; Quit window
  "wd" 'kill-buffer-and-window ;; Delete window & buffer 
  )

(leader-spc-spc 'normal 'override
  "s" 'eval-last-sexp
  "g" 'general-describe-keybindings
  "a" 'salorak/absolute-buffer-name-on-clipboard
  "n" 'salorak/buffer-name-on-clipboard
  )

(defvar salorak/keymaps-list
  '(
    ;; consult
    ivy
    compilation
    magit
    projectile
    org
    )
  )

;; Load plugin keymaps 
(salorak/load-plugins salorak/keymaps-list 'keymaps)

