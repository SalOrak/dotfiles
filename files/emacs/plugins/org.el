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
  (setq org-directory "~/org/")
  (setq org-capture-templates
	'(("n" "Inbox" entry
	   (file "~/org/inbox.org") "* %^{Description} %^g\n Added: %U\n%?")
	  ("m" "Meeting notes" entry
	   (file "~/org/meetings.org") "* TODO %^{Title} %t\n- %?")
	  ("t" "TODO" entry
	   (file "~/org/inbox.org") "* TODO %^{Title}")
	  ("e" "Event" entry
	   (file "~/org/calendar.org") "* %^{Is it a todo?||TODO |NEXT }%^{Title}\n%^t\n%?")
	))
  :hook (org-capture-mode . evil-insert-state)
  )

;; Org-Roam (Zettlekasten)
(use-package org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/zettlekasten/"))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (setq org-timer-default-timer "0:35:00") ; Set timer to Pomodoro 35 min
  (setq org-roam-capture-templates '(
				("d" "zettlekasten" plain "%?"
				 :if-new (file+head "${slug}.org" "#+TITLE: %{title}\n#+DATE: %T\n* %\\1\n ")
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
