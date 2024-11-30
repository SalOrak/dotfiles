;; General things for emacs to work properly

(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    "cc" 'compile
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
    "C-y" 'salorak/absolute-buffer-name-on-clipboard
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

  ;; Bookmarks
  (:keymaps 'override
            "C-x r D" 'bookmark-delete
            "C-x r I" 'bookmark-insert
            "C-x r R" 'bookmark-rename
            "C-x r C" 'bookmark-relocate
            "C-x r S" 'bookmark-save
            )
  ;; Move through the minibuffer history using C-n C-p
  (:keymaps '(minibuffer-mode-map)
            "C-n" 'next-line-or-history-element
            "C-p" 'previous-line-or-history-element)
  (:keymaps 'override
            "M-l" 'sk/select-current-line-and-forward-line :wk "Mark current line"
            )

  (:keymaps 'override
            "C-x C-1" 'sk/window-kill-current :wk "Window: Kill current ")
  :hook
  (add-hook 'compilation-filter-hook 'sk/colorize-compilation-buffer)
  )

