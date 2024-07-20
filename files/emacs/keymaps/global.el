;; Globally available keymaps

(leader-global
  :states 'normal
  :keymaps 'override
  "o" 'ace-window
  ;; "u" 'undo-tree-visualize
  "cr" 'recompile
  "cg" 'compilation-goto-in-progress-buffer
  "fe" 'find-file
  "fp" 'find-file-at-point
  "fd" 'find-file-in-current-directory
  "bl" 'ibuffer
  "dd" 'dired
  "do" 'dired-other-window
  ;; "wo" 'delete-other-windows ;; Delete other windows
  "ww" 'save-buffer ;; Save buffers
  "k" 'general-describe-keybindings
  )

;; (leader-global 'normal 'override
;;   "s" 'eval-last-sexp
;;   "g" 'general-describe-keybindings
;;   "k" 'counsel-descbinds
;;   "a" 'salorak/absolute-buffer-name-on-clipboard
;;   "n" 'salorak/buffer-name-on-clipboard
;;   "i" 'nerd-icons-insert
;;   )
