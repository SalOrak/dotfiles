(use-package god-mode
  :ensure t
  :general
  (:keymaps 'override
            "M-'" 'god-local-mode)
  (:keymaps 'god-local-mode-map
            "{" 'backward-paragraph
            "}" 'forward-paragraph
            "[" 'backward-sexp
            "]" 'forward-sexp
            )
  )
