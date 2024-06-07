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

(leader-spc-spc 'normal 'override
  "s" 'eval-last-sexp
  "g" 'general-describe-keybindings
  "k" 'counsel-descbinds
  "a" 'salorak/absolute-buffer-name-on-clipboard
  "n" 'salorak/buffer-name-on-clipboard
  "i" 'nerd-icons-insert
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
    org-agenda
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
