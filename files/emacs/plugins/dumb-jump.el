;; Jump ot definition packgae with supporp for +50 programming languageso that
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
  (defun sk/dumb-jump-activate ()
    "Activate dumb-jump mode and setup `xref' backend functions."
    (dumb-jump-mode 1)
    (setq-local xref-backend-functions '(dumb-jump-xref-activate))
    )
  (defun sk/--dumb-jump-create-hook (lang)
    "Create the appropiate mode hook to the lang:
Given typescript as `lang', it transforms it into typescript-mode-hook
And adds the dumb-jump-activate into that hook"
    (let ((lang-hook (intern (concat lang "-mode-hook"))))
      (when (boundp lang-hook)
        (add-hook lang-hook #'sk/dumb-jump-activate)
        )))
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  :config
  (message "[DUMB-JUMP] Configuring dumb-jump")
  (setq xref-backend-functions '(dumb-jump-xref-activate))
  (advice-add 'dumb-jump-get-project-root :override #'sk/--whaler--cwd)
  (setq dumb-jump-mode t)

  ;; List of modes where dumb-jump is automatically setup
  (setq sk/dumb-jump-programming-modes 
        '(
         rust
         rust-ts
         php
         lua
         lua-ts
         typescript
         typescript-ts
         go
         go-ts
         kotlin
         nix))

  ;; Activate dumb-jump in each of these modes
  (mapc #'sk/--dumb-jump-create-hook (mapcar #'symbol-name sk/dumb-jump-programming-modes))
  ;;                                    ^ this is to turn  --> ^ this into a list of strings
  (message "[DUMB-JUMP] Finished configuring dumb-jump")

  )
