;; Org-Mode
(use-package org
  :general
  ;; Org notes
  (leader-global 'normal 'override
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
  :ensure t
  :init
  (require 'org-capture)
  ;; Custom functions
  (defun salorak/org-goto-string (template)
    "Org go to TEMPLATE working at Emacs init"
    (interactive)
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
  :hook
  (org-capture-mode . evil-insert-state)
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
