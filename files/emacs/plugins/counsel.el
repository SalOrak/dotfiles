;; Counsel
;; A collection of Ivy-enhanced versions of common Emacs commands
(use-package counsel
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
