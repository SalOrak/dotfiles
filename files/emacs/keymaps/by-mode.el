;; Keymaps mapped by mode/s

;; Emacs Lisp Buffers
(leader-by-mode
  :states 'normal
  :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
  "s" 'eval-defun
  "b" 'eval-buffer)
