;; A better M-x . 
(use-package amx
  :ensure t
  :config
  (setq amx-backend 'ivy)
  (amx-mode t))
