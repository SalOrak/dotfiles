;; Vertico
;; Provides performant and minimalistic vertical completion UI.
(use-package vertico
  :config
  (vertico-mode)
  (vertico-multiform-mode)
  (setq vertico-multiform-commands
        '((consult-imenu buffer reverse)
          (consult-imenu-multi buffer reverse)))
  )


