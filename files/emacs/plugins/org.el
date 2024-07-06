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
  (setq org-capture-templates
	'(
	  ("i" "Inbox" entry
	   (file "~/org/inbox.org") (file "~/org/templates/inbox.org") :empty-lines 1)
	  ("t" "TODO" entry
	   (file "~/org/todo.org") (file "~/org/templates/todo.org") :empty-lines 1)
	  ("e" "Event" entry
	   (file "~/org/calendar.org") (file "~/org/templates/calendar.org"):empty-lines 1)
	  ("m" "Meetings" entry
	   (file "~/org/meetings.org") (file "~/org/templates/meetings.org")
	   )
	  ("c" "Calendar" entry
	   (file "~/org/calendar.org") (file "~/org/templates/calendar.org"))
	  ("v" "Master" entry
	   (file "~/org/vingtsun/masters.org") "* %^t\n** Hoy\n** Futura\n** Comentarios%?")
	 ("s" "Stream")
	  ("st" "Todo" entry
	   (file "~/org/stream/inbox.org") (file "~/org/stream/templates/inbox.org")
	   :empty-lines 1
	   :immediate-finish  t
	   )
	  ("so" "Linux from Scratch" entry
	   (file+headline "~/org/stream/lfs.org" "Daily") (file "~/org/stream/templates/lfs.org")
	   :empty-lines 1
	   :clock-in t
	   :clock-keep t)
	))
  (setq org-agenda-files '("~/org/inbox.org" "~/org/todo.org" "~/org/meetings.org" "~/org/calendar.org"))
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
