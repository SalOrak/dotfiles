;; Org-Roam (Zettlekasten)
(use-package org-roam
	     :demand t
  :general
  ;; Org Roam mode commands
  (leader-global
    "ac" 'org-roam-capture ;; Zettlekasten capture
    "af" 'org-roam-node-find   ;; Finds zettlekasten by title or tag
    "at" 'org-roam-dailies-goto-today ;; Goto Today
    "ay" 'org-roam-dailies-goto-yesterday ;; Goto Yesterday
    "ad" 'org-roam-dailies-goto-date   ;; Goto Date (using Agenda)
    "ag" 'org-roam-graph ;; Create graph
    )
  (leader-by-mode
    :keymaps '(org-roam-mode-map)
    "o" 'org-open-at-point ; Open (follow link) at point
    "r" 'org-roam-refile
    "," 'org-do-demote
    "." 'org-do-promote
    "t" 'org-roam-tag-add    ; [T]ag
    "u" 'org-roam-tag-remove ; [U]ntag
    "a" 'org-todo ;; Cycle TODO entries
    "i" 'org-roam-node-insert
    "b" 'org-roam-buffer-toggle
    "ci" 'org-clock-in
    "co" 'org-clock-out
    "cc" 'org-clock-cancel
    "z" 'org-narrow-to-subtree
    "w" 'widen
    )
  (:keymaps 'override
            "M-o" 'org-roam-capture
            "M-A" 'org-roam-dailies-goto-today
            "M-D" 'org-roam-dailies-goto-date
            )
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/personal/org/zettlekasten/"))
  :config
  (setq truncate-lines nil)
  (setq org-roam-node-display-template (concat "${title:30} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (setq org-timer-default-timer "0:35:00") ; Set timer to Pomodoro 35 min
  (setq org-roam-capture-templates `(
                                     ("d" ;; key
                                      "zettlekasten" ;; Description
                                      plain ;; Type
                                      (file "~/personal/org/templates/zt.org")
                                      :if-new (file "${slug}.org")
                                      :unnarrowed t)
                                     ))
  )
