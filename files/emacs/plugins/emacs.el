;; General things for emacs to work properly
(use-package emacs
  :general
  ;; ----------------
  ;; Global Commands
  ;; ----------------
  (leader-global
    "e" 'compile
    "." '(async-shell-command :wk "Here Async Shell")
    "s" 'recompile
    "C-s" 'recompile
    "o" 'sk/compilation-goto-last-running-compilation-buffer
    "3" 'sk/compilation-delete-windows
    "1" 'query-replace-regexp
    ;; "d" 'dired-other-window
    ;; "ww" 'save-buffer ;; Save buffers
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
    "p" 'pp-eval-last-sexp
    "b" 'eval-buffer
    )
  ;; Compilation mode keybindings
  (:keymaps
   '(compilation-mode-map)
   "n" 'compilation-next-error
   "p" 'compilation-previous-error
   "r" 'recompile
   )
  (:keymaps 'override
            "<escape>" 'keyboard-quit
            "C-M-n" 'next-error
            "C-M-p" 'previous-error
            )
  ;; Bookmarks
  (leader-global :keymaps 'override
    ;; "C-x r D" 'bookmark-delete
    ;; "C-x r I" 'bookmark-insert
    ;; "C-x r R" 'bookmark-rename
    ;; "C-x r C" 'bookmark-relocate
    ;; "C-x r S" 'bookmark-save
    "bd" 'bookmark-delete
    "bi" 'bookmark-insert
    "br" 'bookmark-rename
    "bl" 'bookmark-relocate
    ;; "bs" 'bookmark-save
    "bs" 'bookmark-set
    "bj" 'consult-bookmark
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
            "C-z" 'zap-up-to-char :wk "Zap UP to"
            )
  ;; Window management
  (:keymaps 'override
            "C-x C-1" 'sk/window-switch-and-kill-current :wk "Window: Kill current "
            "C-x C-3" 'split-window-right :wk "Split Window Right"
            )
  )


