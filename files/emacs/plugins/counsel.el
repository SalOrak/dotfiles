;; Counsel
;; A collection of Ivy-enhanced versions of common Emacs commands
(use-package counsel
  :general
  (leader-global 'normal 'override
    "i" 'counsel-imenu
    ;; "nu" 'counsel-org-capture ; Normal capture
    "fr" 'counsel-buffer-or-recentf
    "fg" 'counsel-git-grep
    "bb" 'counsel-switch-buffer
    "bo" 'counsel-switch-buffer-other-window
    "yy" 'counsel-yank-pop
    "yd" 'counsel-mark-ring
    "tj" 'salorak/counsel-load-theme
    "ta" 'counsel-org-tag
    "eg" 'counsel-org-agenda-headlines
    "ee" 'counsel-org-entity
    "el" 'counsel-org-link
    "hk" 'counsel-descbinds
    "hf" 'counsel-describe-function
    "hv" 'counsel-describe-variable
    "hs" 'counsel-describe-symbol
    "gw" 'counsel-git-change-worktree
    )

  (:keymaps '(normal visual)
            "/" 'swiper)
  :config
  (counsel-mode 1)
  )

(defun salorak/counsel-load-theme ()
  "Load theme adding appropiate hooks"
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (counsel-load-theme)
  (when (functionp 'doom-themes-org-config)
    (doom-themes-org-config)
    )
  )
