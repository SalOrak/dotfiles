;; Org notes
(leader-spc 'normal 'override
  "nn" 'org-roam-capture ; Zettlekasten capture
  "nu" 'org-capture ; Normal capture
  "nf" 'org-roam-node-find
  "ni" 'org-roam-node-insert 
  "nt" 'org-roam-buffer-toggle
  "nl" 'org-capture-goto-last-stored
  "ti" 'org-timer-set-timer
  "tt" 'org-timer-pause-or-continue
  "ts" 'org-timer-stop
  )

;; Org agenda
(leader-spc 'normal 'override
  "aa" 'org-agenda
  )

;; Org-mode commands
(leader-spc
  :states 'normal
  :keymaps 'org-mode-map
  "gd" 'org-open-at-point ; Open (follow link) at point
  ",>" 'org-do-demote
  ",<" 'org-do-promote
  "ta" 'org-roam-tag-add
  "tr" 'org-roam-tag-remove
  "tc" 'org-todo ;; Cycle TODO entries
  "ci" 'org-clock-in
  "co" 'org-clock-out
  "cs" 'org-clock-cancel
  )

;; Org-capture commands
(leader-spc
  :states 'normal
  :keymaps 'org-capture-mode-map
  "cc" 'org-capture-finalize
  "cw" 'org-capture-refile
  "ck" 'org-capture-kill
  )
