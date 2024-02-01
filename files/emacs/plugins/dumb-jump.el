;; Jump to definition packgae with supporp for +50 programming languageso that
;; favors the "just working". It uses ag, rg or grep to find potential definitions.
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read)
  )
