;; Keymaps mapped by mode/s

;; Emacs Lisp Buffers
(leader-by-mode
  :states 'normal
  :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
  "f" 'eval-defun
  "s" 'eval-last-sexp
  "b" 'eval-buffer)


