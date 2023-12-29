(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (setq projectile-project-search-path '(
					 ("~/personal/" . 1)
					 ("~/programming/" . 1)
					 ("~/notes/" . 1)
					 )
	)
  )
