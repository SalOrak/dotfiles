;; Org notes
(leader-spc 'normal 'override
  "nn" 'org-roam-capture ; Zettlekasten capture
  "nu" 'org-capture ; Normal capture
  "nl" 'org-capture-goto-last-stored ;; go to last capture
  "nf" 'org-roam-node-find   ;; finds zettlekasten by title or tag
  "ng" 'org-capture-goto-target ;; Goes to normal capture file
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
  "tk" 'org-toggle-checkbox;; Cycle TODO entries
  "ni" 'org-roam-node-insert 
  "nt" 'org-roam-buffer-toggle
  )

;; Org-capture commands
(leader-spc
  :states '(normal emacs)
  :keymaps 'org-capture-mode-map
  "cc" 'org-capture-finalize
  "cw" 'org-capture-refile
  "ck" 'org-capture-kill
  )
