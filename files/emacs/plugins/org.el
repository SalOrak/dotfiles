;; Org-Mode
(use-package org
  :ensure t
  :config
  (setq org-todo-keywords
	'((sequence "TODO(t!)" "|"
		    "STARTED(s!)" "|"
		    "DONE(d!)" "CANCELLED(c@)")))
  (setq org-todo-keyword-faces
	'(("TODO" . (:foreground "#ffaf87" :weight bold ))
	  ("STARTED" . (:foreground "#f1c40f" :weight bold ))
	  ("DONE" . (:foreground "#2ecc71" :weight bold))
	  ("CANCELLED" . (:foreground "#c0392b" :weight bold))
	  ))
  (setq org-startup-folded t)
  (setq org-startup-truncated nil)
  (setq org-enforce-todo-dependencies t)
  (setq org-directory "~/org/")
  :hook
  (org-capture-mode . evil-insert-state)
  (org-mode . org-indent-mode)
  )

;; Org-Roam (Zettlekasten)
(use-package org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/zettlekasten/"))
  :config
  (setq truncate-lines nil)
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (setq org-timer-default-timer "0:35:00") ; Set timer to Pomodoro 35 min
  (setq org-roam-capture-templates `(
				     ("d" ;; key
				      "zettlekasten" ;; Description
				      plain ;; Type
				      (file "~/org/templates/zt.org")
				      :if-new (file "${slug}.org")
				      :unnarrowed t)
				))
  :hook (org-capture-mode . evil-insert-state)
  )

;; Org-bullet
;; Show org-mode bullets as UTF-8 characters
(use-package org-bullets
  :after org-roam
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )
