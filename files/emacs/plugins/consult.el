 ;;; -*- lexical-binding: t; -*-

;; Consult 
;; Provides search and navigation commands.
(use-package consult
  :general
  (leader-global :keymaps 'override
    "i" 'consult-imenu
    "m" 'consult-man
    "th" 'consult-info
    "tj" 'consult-theme
    ;; "bb" 'consult-buffer
    ;; "bp" 'consult-project-buffer
    )

  (:keymaps 'override
            "C-x b" 'consult-buffer
            "C-x r a" 'consult-register
            "C-x r b" 'consult-bookmark
            )
  :config
  (setq consult-project-function (lambda (_) (whaler-current-working-directory)))
  (setq consult-async-refresh-delay 0.2)
  (setq consult-async-input-throttle 0.2)
  (setq consult-async-min-input 2)
  (setq consult-async-split-style 'comma)
  (setq consult-fd-args '((if (executable-find "fdfind" 'remote) "fdfind" "fd")" --color=never --hidden --exclude .git/*"))

  ;; Custom functions
  (defun sk/consult-fd (dir)
    "Custom `consult-fd' that automatically shows all files at startup.
It does so by adding the pattern '#*'"
    (interactive)
    (setq-local pattern "")
    (consult-fd dir pattern)))
