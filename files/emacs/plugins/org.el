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
  (setq org-enforce-todo-dependencies t)
  (setq org-startup-truncated nil)
  (setq org-startup-folded t)
  (setq org-startup-indented t)
  (setq org-directory "~/org/")
  (setq org-capture-templates
	'(
	  ("g" "GTD")
	  ("gi" "Inbox" entry
	   (file "~/org/inbox.org") "* %^{title} %^{Description} %^g\nAdded: %U\n%?")
	  ("gt" "TODO" entry
	   (file "~/org/inbox.org") "* TODO %^{title} %^g\nADDED:%U\nDEADLINE:%^t\n%?")
	  ("gc" "Calendar" entry
	   (file "~/org/calendar.org") "* %^{What type of event is?||MEET|DATE}%^{Title}\n%^t\n%?")
	  ("v" "Ving Tsun")
	  ("vn" "Notes" entry
	   (file "~/org/vingtsun/notes.org") "*** %t\n%?")
	  ("vm" "Master" entry
	   (file "~/org/vingtsun/masters.org") "* %^t\n** Hoy\n** Futura\n** Comentarios%?")
	  ("vc" "Concepts" entry
	   (file "~/org/vingtsun/concepts.org") "** $^{title}\n%^{Description}\n%?")
	 ("s" "Stream")
	  ("st" "Todo" entry
	   (file "~/org/stream/inbox.org") (file "~/org/stream/templates/inbox.org")
	   :empty-lines-after 1
	   :immediate-finish  t
	   )
	  ("so" "Linux from Scratch" entry
	   (file+headline "~/org/stream/lfs.org" "Daily") (file "~/org/stream/templates/lfs.org")
	   :empty-lines-after 1
	   :clock-in t
	   :clock-keep t)
	))
  (setq org-agenda-files '("~/org/inbox.org"  "~/org/calendar.org"))
  :hook (org-capture-mode . evil-insert-state)
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
