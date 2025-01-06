;; Org-Mode
(use-package org
  
  :general
  ;; Org - General
  (leader-global
    "no" 'org-clock-goto ;; G[O]to Clock
    "nc" 'org-capture ; Org capture capture
    "nl" 'org-capture-goto-last-stored ;; go to [P]revious capture
    "ng" 'org-capture-goto-target ;; Goes to Target [Select]
    "na" 'org-agenda
    )
  
  ;; Org by mode commands
  (leader-by-mode
    :keymaps '(org-mode-map)
    "o" 'org-open-at-point ; Open (follow link) at point
    "r" 'org-refile
    "," 'org-do-demote
    "." 'org-do-promote
    ;; "ta" 'counsel-org-tag
    "t" 'org-set-tags-command
    "a" 'org-todo ;; Cycle TODO entries
    "ci" 'org-clock-in
    "co" 'org-clock-out
    "cc" 'org-clock-cancel
    "cl" 'org-clock-in-last
    "z" 'org-narrow-to-subtree
    "w" 'widen
    )
  
  :ensure t
  :init
  (require 'org-capture)
  (defun sk/org-setup-directories ()
    "Setup Org directories to easily work with multiple org directories."
    (setq sk/personal-org-repo (f-expand "~/personal/org"))
    (setq sk/work-org-repo (f-expand "~/work/org"))
    (setq sk/monolith-org-dir (f-expand "~/org"))
    ;; Check if org directory is created, if not, create it.
    (when (not (f-directory-p sk/monolith-org-dir))
      (f-mkdir-full-path sk/monolith-org-dir)
      )
    ;; Check if repositories are downloaded, then symlink them.
    (let (
          (personal-org-sym (s-concat sk/monolith-org-dir "/personal"))
          (work-org-sym (s-concat sk/monolith-org-dir "/work"))
          )
      (when (and (f-directory-p sk/personal-org-repo) (not (f-directory-p personal-org-sym)))
        (f-symlink sk/personal-org-repo personal-org-sym)
        )
      (when (and (f-directory-p sk/work-org-repo) (not (f-directory-p work-org-sym)))
        (f-symlink sk/work-org-repo work-org-sym)
        )
      )
    )
  
  (defun sk/org-append-capture-template (entries)
  "Append the capture templates in the list `entries' as capture templates.
They will be stored in the `org-capture-templates'."
  (let (val)
    (dolist (entry entries val) (add-to-list 'org-capture-templates entry t))))


  :config
  (sk/org-setup-directories)
  (setq org-goto-auto-isearch nil) ; Don't start isearch in org-got mode automatically
  (setq org-todo-keywords
        '((sequence "REFILL" "TODO(t!)" "|"
                    "STARTED(s!)" "BLOCKED(b@/!)" "|"
                    "DONE(d!)" "CANCELLED(c@)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "#ffaf87" :weight bold ))
          ("STARTED" . (:foreground "#f1c40f" :weight bold ))
          ("BLOCKED" . (:foreground "#990077" :weight bold ))
          ("DONE" . (:foreground "#2ecc71" :weight bold))
          ("CANCELLED" . (:foreground "#c0392b" :weight bold))
          ("REFILL" . (:foreground "#00ced1"))
          ))
  (setq org-startup-folded nil)
  (setq org-startup-truncated nil)
  (setq org-enforce-todo-dependencies t)
  (setq org-directory "~/org/")
  (setq sk/org-personal-dir (concat org-directory "personal/"))
  (setq sk/org-work-dir (concat org-directory "work/"))
  (setq org-capture-templates
        '(
          ("i" "[Personal] Inbox" entry
           (file (concat sk/org-personal-dir "inbox.org")) (file (concat sk/org-personal-dir "templates/inbox.org")) :empty-lines 1)
          ))

  (setq org-agenda-files '("~/org/"))

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

