;; Custom functions
(defun salorak/org-goto-string (template)
  "Org go to TEMPLATE working at Emacs init"
  (interactive)
  (require 'org-capture)
  (org-capture-goto-target template))

(defun salorak/org-goto-inbox ()
  "Org capture go to inbox file"
  (interactive)
  (salorak/org-goto-string "i"))

(defun salorak/org-goto-todo ()
  "Org capture go to todo file"
  (interactive)
  (salorak/org-goto-string "t"))

(defun salorak/org-goto-hacking ()
  "Org capture go to todo file"
  (interactive)
  (salorak/org-goto-string "h"))

;; Org notes
(leader-spc 'normal 'override
  "nu" 'org-capture ; Org capture capture
  "nn" 'org-roam-capture ; Zettlekasten capture
  "nl" 'org-capture-goto-last-stored ;; go to last capture
  "nf" 'org-roam-node-find   ;; finds zettlekasten by title or tag
  "ng" 'org-capture-goto-target ;; Goes to normal capture file
  "ni" 'salorak/org-goto-inbox;; Goes to Inbox
  "nt" 'salorak/org-goto-todo ;; Goes to Todo 
  "nh" 'salorak/org-goto-hacking;; Goes to Todo 
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

;; Org Roam mode commands
(leader-spc
  :keymaps 'org-roam-mode-map
  :states 'normal
  "gd" 'org-open-at-point ; Open (follow link) at point
  ">" 'org-do-demote
  "<" 'org-do-promote
  "ta" 'org-roam-tag-add
  "tr" 'org-roam-tag-remove
  "tc" 'org-todo ;; Cycle TODO entries
  "tk" 'org-toggle-checkbox;; Cycle TODO entries
  "ni" 'org-roam-node-insert 
  "nt" 'org-roam-buffer-toggle
  "ci" 'org-clock-in
  "co" 'org-clock-out
  "cc" 'org-clock-cancel
  "zz" 'org-narrow-to-subtree
  "zw" 'widen
  )

;; Org-capture commands
(leader-spc
  :keymaps 'org-capture-mode-map
  :states '(normal)
  "cc" 'org-capture-finalize
  "cw" 'org-capture-refile
  "ck" 'org-capture-kill
  )
