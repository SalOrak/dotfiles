;; General things for emacs to work properly

(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    "cr" 'recompile
    "cg" 'sk/compilation-goto-last-running-compilation-buffer
    "cw" 'sk/compilation-delete-windows
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
            "M-(" 'backward-sexp
            "M-)" 'forward-sexp
            "C-M-n" 'next-error
            "C-M-p" 'previous-error
            )
  ;; Move through the minibuffer history using C-n C-p
  (:keymaps '(minibuffer-mode-map)
            "C-n" 'next-line-or-history-element
            "C-p" 'previous-line-or-history-element)
  (:keymaps 'override
            "M-l" 'sk/select-current-line-and-forward-line :wk "Mark current line"
  )
  :config
  (defun sk/select-current-line-and-forward-line (arg)
    "Select the current line and move the cursor by ARG lines IF
no region is selected.

If a region is already selected when calling this command, only move
the cursor by ARG lines."
    (interactive "p")
    (when (not (use-region-p))
      (forward-line 0)
      (set-mark-command nil))
    (forward-line arg))

  

)
