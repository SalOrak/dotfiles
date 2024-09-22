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
  )



