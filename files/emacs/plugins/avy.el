(use-package avy
  :ensure t
  :custom
  (setq avy-keys '(?h ?t ?n ?s))
  (setq avy-style 'at)
  (setq avy-all-windows 'all-frames) ;; All windows
  )

(use-package ivy-avy
  :ensure t
  )
