;; General things for emacs to work properly

(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    "cr" 'recompile
    "cg" 'compilation-goto-in-progress-buffer
    "fe" 'find-file
    "fp" 'find-file-at-point
    "fd" 'find-file-in-current-directory
    "bl" 'ibuffer
    "dd" 'dired
    "do" 'dired-other-window
    ;; "ww" 'save-buffer ;; Save buffers
    "K" 'general-describe-keybindings
    )

  ;; ----------------
  ;; By mode Commands
  ;; ----------------

  ;; Emacs Lisp Buffers
  (leader-by-mode
    :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
    "f" 'eval-defun
    "s" 'eval-last-sexp
    "b" 'eval-buffer)

  ;; Compilation mode keybindings 
  (:keymaps '(compilation-mode-map)
   "n" 'compilation-next-error
   "p" 'compilation-previous-error
   )
  
  (:keymaps 'override
            "<escape>" 'keyboard-quit
            "M-p" 'pop-global-mark
            )
  )
