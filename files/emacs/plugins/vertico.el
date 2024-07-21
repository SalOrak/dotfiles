;; Vertico
;; Provides performant and minimalistic vertical completion UI.
(use-package vertico
  :config
  (vertico-mode)
  (vertico-multiform-mode)
  (setq vertico-multiform-commands
        '((consult-imenu buffer reverse)
          (consult-imenu-multi buffer reverse)
          (salorak/whaler-consult-search-string buffer)
          (salorak/whaler-consult-search-string-other buffer)
          (salorak/whaler-counsel-search-string buffer)
          (salorak/whaler-counsel-search-string-other buffer)
          (consult-ripgrep buffer)))
  )


