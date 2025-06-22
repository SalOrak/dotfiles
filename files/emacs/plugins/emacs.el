;; General things for emacs to work properly
(use-package emacs
  :config

  (defun sk/--print-register (r)
    "Deserializes the mark and converts it to the following format:
        buffername Line:Column"
    (interactive)
    (let* ((reg r)
       (val (get-register reg)))
  (when (markerp val)
    (let* ((pos (marker-position val))
           (buf (marker-buffer val))
           (line (with-current-buffer buf
                   (line-number-at-pos pos)))
           (col (with-current-buffer buf
                  (save-excursion
                    (goto-char pos)
                    (current-column))))
           (buf-name (buffer-name buf)))
      (format "%s:%d:%d"  buf-name line col)))))

  (defun sk/save-to-register (r)
    (interactive)
    (set-register 5 (get-register r))
    (set-register 6 r)
    (point-to-register r)
    )

  (defun sk/revert-last-register ()
    (interactive)
    (let* (
           (last-reg (get-register 6))
           (last-reg-content (get-register last-reg))
           (last-reg-changes (get-register 5))
           )
      (set-register last-reg last-reg-changes)
      (set-register 5 last-reg-content)
      )
    )
  
  (defhydra hydra-harpoon (:color blue)
    "
    _1_: %(sk/--print-register 1)
    _2_: %(sk/--print-register 2)
    _3_: %(sk/--print-register 3)
    _4_: %(sk/--print-register 4)

    _l_: See last registry changes: %(sk/--print-register 5)
    _r_: Reverse -> Register %(get-register 6): %(sk/--print-register 5)

"
    ("1" #'(lambda () (interactive) (sk/save-to-register 1)) nil)
    ("2" #'(lambda () (interactive) (sk/save-to-register 2)) nil)
    ("3" #'(lambda () (interactive) (sk/save-to-register 3)) nil)
    ("4" #'(lambda () (interactive) (sk/save-to-register 4)) nil)
    ("l" #'(lambda () (interactive) (point-to-register 5)) nil)
    ("r" #'sk/revert-last-register nil) 
    )
  
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
            ;; "C-M-n" 'next-error
            ;; "C-M-p" 'previous-error
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

  ;; Harpoon like
  (:keymaps 'override
            "M-1" #'(lambda () (interactive) (jump-to-register 1)) :wk "Goto 1"
            "M-2" #'(lambda () (interactive) (jump-to-register 2)) :wk "Goto 2"
            "M-3" #'(lambda () (interactive) (jump-to-register 3)) :wk "Goto 3"
            "M-4" #'(lambda () (interactive) (jump-to-register 4)) :wk "Goto 4"
            "M-q" #'hydra-harpoon/body :wk "Harpoon Save Registers"
            )
  )



