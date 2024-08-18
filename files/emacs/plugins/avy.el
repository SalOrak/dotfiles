(use-package avy
  :general
  ("M-a" 'avy-goto-char-timer) ;; Go to char by timing.
  :ensure t
  :custom
  (setq avy-background nil)
  (setq avy-keys '(?h ?t ?n ?s ?a ?o ?e ?i))
  (setq avy-timeout-seconds 0.5)
  (setq avy-enter-times-out t)
  (setq avy-style 'at)
  (setq avy-all-windows 'all-frames) ;; All windows
  )
                
