;; Org notes
(leader-spc 'normal 'override
  "nu" 'org-capture ; Org capture capture
  "nn" 'org-roam-capture ; Zettlekasten capture
  "nl" 'org-capture-goto-last-stored ;; go to last capture
  "nf" 'org-roam-node-find   ;; finds zettlekasten by title or tag
  "ng" 'org-capture-goto-target ;; Goes to normal capture file
  "ti" 'org-timer-set-timer
  "tt" 'org-timer-pause-or-continue
  "ts" 'org-timer-stop
  "cg" 'org-clock-goto
  )

;; Org agenda
(leader-spc 'normal 'override
  "aa" 'org-agenda
  )

;; Org mode commands
(leader-spc
  :keymaps 'org-mode-map
  :states 'normal
  "gd" 'org-open-at-point ; Open (follow link) at point
  ">" 'org-do-demote
  "<" 'org-do-promote
  "ta" 'counsel-org-tag
  "tr" 'org-set-tags-command
  "tc" 'org-todo ;; Cycle TODO entries
  "tk" 'org-toggle-checkbox;; Cycle TODO entries
  "ci" 'org-clock-in
  "co" 'org-clock-out
  "cc" 'org-clock-cancel
  "zz" 'org-narrow-to-subtree
  "zw" 'widen
  )

(leader-spc 
  :keymaps 'org-roam-mode-map
  :states 'normal
  "gd" 'org-open-at-point ; Open (follow link) at point
  ">" 'org-do-demote
  "<" 'org-do-promote
  "ta" 'org-roam-tag-add    ;; Tag Add
  "td" 'org-roam-tag-remove ;; Tag delete
  "ni" 'org-roam-node-insert 
  "nt" 'org-roam-buffer-toggle
  )

;; Org-capture commands
(leader-spc
  :keymaps 'org-capture-mode-map
  :states '(normal)
  "cc" 'org-capture-finalize
  "cw" 'org-capture-refile
  "ck" 'org-capture-kill
  )
