;; General things for emacs to work properly

(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    :states 'normal
    :keymaps 'override
    "cr" 'recompile
    "cg" 'compilation-goto-in-progress-buffer
    "fe" 'find-file
    "fp" 'find-file-at-point
    "fd" 'find-file-in-current-directory
    "bl" 'ibuffer
    "dd" 'dired
    "do" 'dired-other-window
    "ww" 'save-buffer ;; Save buffers
    "k" 'general-describe-keybindings
    )

  ;; ----------------
  ;; By mode Commands
  ;; ----------------

  ;; Emacs Lisp Buffers
  (leader-by-mode
    :states 'normal
    :keymaps '(emacs-lisp-mode-map lisp-interaction-mode-map)
    "f" 'eval-defun
    "s" 'eval-last-sexp
    "b" 'eval-buffer)

  ;; Compilation mode keybindings 
  (:keymaps '(compilation-mode-map) :states '(normal visual)
   "n" 'compilation-next-error
   "p" 'compilation-previous-error
 )
   
)
