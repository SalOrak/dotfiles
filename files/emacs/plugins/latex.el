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
  (setq LaTeX-item-indent tab-width) ; \item identation

  )

(use-package pdf-tools
  :config
  ;; Installation
  (pdf-tools-install)

  ;; Customization
  (setq pdf-view-display-size 'fit-height)
  
  
  (defun sk/pdf-view-pre-setup ()
    ;; Does not work well with line-numbers-mode. So let's deactivate them
    (display-line-numbers-mode -1)
    )

  (advice-add #'pdf-view-mode :after #'sk/pdf-view-pre-setup)
  )



