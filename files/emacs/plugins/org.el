;; Org-Mode
(use-package org
  :general
  ;; Org - General
  (leader-global
    "no" 'org-clock-goto ;; G[O]to Clock
    "nc" 'org-capture ; Org capture capture
    "np" 'org-capture-goto-last-stored ;; go to [P]revious capture
    "nt" 'org-capture-goto-target ;; Goes to Target [Select]
    "na" 'org-agenda
    )
  ;; Org - GTD
  (leader-global 
    "ng" 'salorak/org-goto-gtd-inbox ;; Goes to GTD Inbox
    )
  ;; Org - Memory
  (leader-global 
    "nm" 'salorak/org-goto-memory-inbox ;; Goes to Memory Inbox
    )
  
  ;; Org by mode commands
  (leader-by-mode
    :keymaps '(org-mode-map)
    "o" 'org-open-at-point ; Open (follow link) at point
    ">" 'org-do-demote
    "<" 'org-do-promote
    ;; "ta" 'counsel-org-tag
    "tr" 'org-set-tags-command
    "ct" 'org-todo ;; Cycle TODO entries
    "cc" 'org-toggle-checkbox;; Cycle TODO entries
    "ci" 'org-clock-in
    "co" 'org-clock-out
    "cc" 'org-clock-cancel
    "zz" 'org-narrow-to-subtree
    "zw" 'widen
    )
  :ensure t
  :init
  (require 'org-capture)
  (defun salorak/org-goto-gtd-inbox ()
    "Org capture go to inbox file"
    (interactive)
    (org-capture-goto-target "gi"))

  (defun salorak/org-goto-memory-inbox ()
    "Org capture go to inbox file"
    (interactive)
    (org-capture-goto-target "mi"))

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
          ("g" "GTD")
           ("gi" "Inbox" entry
            (file "~/org/gtd/inbox.org") (file "~/org/templates/inbox.org") :empty-lines 1)
           ("gm" "Mapas" entry
            (file "~/org/gtd/maps/index.org") (file "~/org/templates/inbox.org") :empty-lines 1)
           ("gs" "Systems" entry
            (file "~/org/gtd/systems/index.org") (file "~/org/templates/inbox.org") :empty-lines 1)
           ("gh" "Hatchery" entry
            (file "~/org/gtd/hatchery/index.org") (file "~/org/templates/inbox.org") :empty-lines 1)
          ("m" "Memory")
           ("mi" "Inbox" entry
            (file "~/org/memory/refile.org") (file "~/org/templates/inbox.org") :empty-lines 1)))


  (setq org-agenda-files '(
                           "~/org/gtd/"
                           "~/org/memory/"
                           ))
  :hook
  (org-mode . org-indent-mode)
  )

;; Org-bullet
;; Show org-mode bullets as UTF-8 characters
(use-package org-bullets
  :after org-roam
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )
