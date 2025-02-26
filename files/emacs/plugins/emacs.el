;; General things for emacs to work properly
(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    "e" 'compile
    "s" 'recompile
    "o" 'sk/compilation-goto-last-running-compilation-buffer
    "3" 'sk/compilation-delete-windows
    "1" 'query-replace-regexp
    "3" 'sk/compilation-delete-windows
    "d" 'dired-other-window
    ;; "ww" 'save-buffer ;; Save buffers
    "K" 'general-describe-keybindings
    "C-y" 'sk/absolute-buffer-name-on-clipboard
    )
  ;; ----------------
  ;; By mode Commands
  ;; ----------------

  ;; Emacs Lisp Buffers
  (leader-by-mode
    :keymaps
    '(emacs-lisp-mode-map lisp-interaction-mode-map)
    "f" 'eval-defun
    "s" 'eval-last-sexp
    "b" 'eval-buffer
    )
  ;; Compilation mode keybindings
  (:keymaps
   '(compilation-mode-map)
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
  
  ;; Buffer management
  (:keymaps 'override
            "C-x C-b" 'ibuffer
            "C-x b" 'consult-buffer
            )
  ;; Movement
  (:keymaps 'override
            ;; "M-l" 'sk/select-current-line-and-forward-line :wk "Mark current line"
            "M-l" 'sk/duplicate-line :wk "Duplicate line"
            )
  ;; Window management
  (:keymaps 'override
            "C-x C-1" 'sk/window-switch-and-kill-current :wk "Window: Kill current "
            "C-x C-3" 'split-window-right :wk "Split Window Right"
            )
  :hook
  (add-hook 'compilation-filter-hook 'sk/colorize-compilation-buffer)
  )
