;; MaGit
(use-package magit
             :ensure t
             :config
             (setq-default magit-auto-revert-mode nil)
			 (magit-add-section-hook #'magit-status-headers-hook #'magit-insert-user-header t) ;; Insert User Status in Magit 
			 )
