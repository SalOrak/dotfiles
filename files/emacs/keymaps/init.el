;; Core keymaps

;; Global keymaps
(leader-spc 'normal 'override
  "o" 'ace-window
  "u" 'undo-tree-visualize
  "cr" 'recompile
  "cg" 'compilation-goto-in-progress-buffer
  "fe" 'find-file
  "fp" 'find-file-at-point
  "fd" 'find-file-in-current-directory
  "bl" 'ibuffer
  "dd" 'dired
  "do" 'dired-other-window
  "wo" 'delete-other-windows ;; Delete other windows
  )

;; Text scaling: increase, decrease reset to global default
(general-define-key
 :states '(emacs visual normal insert)
 :override t
  "C-!" (lambda () (interactive) (text-scale-increase 1));; Increase text size
  "C--" (lambda () (interactive) (text-scale-decrease 1));; Decrease text size
  "C-=" (lambda () (interactive) (text-scale-adjust 0)) ;; Reset text size
  )

(leader-spc-spc 'normal 'override
  "s" 'eval-last-sexp
  "g" 'general-describe-keybindings
  "k" 'counsel-descbinds
  "a" 'salorak/absolute-buffer-name-on-clipboard
  "n" 'salorak/buffer-name-on-clipboard
  )

(defvar salorak/keymaps-list
  '(
    ;; consult
    evil
    ivy
    compilation
    magit
    ;; projectile
    org
    whaler
    undo
    zoom
    shell-pop
    avy
    hydra
    )
  )

;; Load plugin keymaps 
(salorak/load-plugins salorak/keymaps-list 'keymaps)

