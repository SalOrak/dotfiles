;; Jump to definition packgae with supporp for +50 programming languageso that
;; favors the "just working". It uses ag, rg or grep to find potential definitions.
(use-package dumb-jump
  :ensure t
  :general
  (:keymaps 'override
    "M-." 'xref-find-definitions
    "M-," 'xref-go-back
    "C-M-," 'xref-go-forward
    )
  :init
  (defun sk/--whaler--cwd (filepath)
    whaler-current-working-directory
    )
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq dumb-jump-quiet t)
  (setq dumb-jump-mode 1)
  (setq dumb-jump-selector "completing-read")
  (advice-add 'dumb-jump-get-project-root :override #'sk/--whaler--cwd)
  )
