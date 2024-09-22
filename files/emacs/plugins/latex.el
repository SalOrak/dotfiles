(use-package auctex
  :ensure t
  :demand t
  :config
  (use-package auctex-latexmk
    :ensure t
    :demand t
    :config
    (auctex-latexmk-setup)
    )
  (use-package reftex
    :ensure t
    :demand t)

  (use-package latex-preview-pane
    :ensure t)

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  )



