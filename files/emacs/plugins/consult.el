 ;;; -*- lexical-binding: t; -*-

;; Consult 
;; Provides search and navigation commands.
(use-package consult
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq completion-in-region-function
	(lambda (&rest args)
	  (apply (if vertico-mode
		     #'consult-completion-in-region
		   #'completion--in-region)
		 args)))
  (advice-add #'register-preview :override #'consult-register-window)
  :config
  (autoload 'projectile-project-root "projectile")
  (setq consult-project-function (lambda (_) (projectile-project-root)))
  )
