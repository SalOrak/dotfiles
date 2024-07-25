;; Org-Roam (Zettlekasten)
(use-package org-roam
  :general
  ;; Org Roam mode commands
  (leader-global
    :states '(normal visual)
    :keymaps 'override
    "ac" 'org-roam-capture ;; Zettlekasten capture
    "af" 'org-roam-node-find   ;; Finds zettlekasten by title or tag
    "at" 'org-roam-dailies-goto-today ;; Goto Today
    "ay" 'org-roam-dailies-goto-yesterday ;; Goto Yesterday
    "ad" 'org-roam-dailies-goto-date   ;; Goto Date (using Agenda)
    "ag" 'org-roam-graph ;; Create graph
    )
  (leader-by-mode
    :keymaps 'org-roam-mode-map
    :states 'normal
    "gf" 'org-open-at-point ; Open (follow link) at point
    ">" 'org-do-demote
    "<" 'org-do-promote
    "ta" 'org-roam-tag-add
    "tr" 'org-roam-tag-remove
    "ct" 'org-todo ;; Cycle TODO entries
    "cc" 'org-toggle-checkbox;; Cycle TODO entries
    "i" 'org-roam-node-insert
    "t" 'org-roam-buffer-toggle
    "ci" 'org-clock-in
    "co" 'org-clock-out
    "cc" 'org-clock-cancel
    "zz" 'org-narrow-to-subtree
    "zw" 'widen
    )
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/org/zettlekasten/"))
  :config
  (setq truncate-lines nil)
  (setq org-roam-node-display-template (concat "${title:30} " (propertize "${tags:10}" 'face 'org-tag)))
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
