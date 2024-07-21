(use-package projectile
  :general
  (leader-global 'normal 'override
    "ff" 'projectile-find-file
    "fo" 'projectile-find-file-other-window
    "ss" 'projectile-ripgrep
    "ps" 'projectile-run-eshell ;; Run eshell root project
    "pd" 'projectile-dired ;; Run dired in the root of the project
    "ww" 'projectile-switch-project ;; New whaler
    "pc" 'projectile-compile-project ;; Compile root project
    )
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
