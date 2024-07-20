;; A better M-x .  Only if using ivy
(use-package amx
  :if (default-value 'ivy-mode)
  :ensure t
  :config
  (message "Ivy mode [ON]")
  (setq amx-backend 'ivy)
  (amx-mode t))




