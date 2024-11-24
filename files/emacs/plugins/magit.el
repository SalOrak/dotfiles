;; MaGit
(use-package magit
  :general
  (leader-global 
    "gg" 'magit
    "gc" 'magit-clone
    "gl" 'magit-log-all
    "gb" 'magit-blame)
  :ensure t
  :demand t
  :config
  (setq-default magit-auto-revert-mode nil)
  (magit-add-section-hook #'magit-status-headers-hook #'magit-insert-user-header t) ;; Insert User Status in Magit 
  )
