;; Configuration for ~org-agenda~
(require 'evil)
(require 'org)

;; Keybinds
(general-define-key
 :keymaps 'org-agenda-mode-map
 :states '(emacs insert normal visual motion)
 ;; Unused keys: D, X

 ;; open
 "gf" 'org-agenda-goto
 "RET" 'org-agenda-switch-to
 ;; "M-RET" 'org-agenda-recenter

 "C-d" 'org-agenda-show-and-scroll-up
 "C-u" 'org-agenda-show-scroll-down

 ;; motion
 "j" 'org-agenda-next-line
 "k" 'org-agenda-previous-line
 "gj" 'org-agenda-next-item
 "gk" 'org-agenda-previous-item
 "C-j" 'org-agenda-next-item
 "C-k" 'org-agenda-previous-item
 "[[" 'org-agenda-earlier
 "]]" 'org-agenda-later

 ;; manipulation
 ;; We follow standard org-mode bindings (not org-agenda bindings):
 ;; <HJKL> change todo items and priorities.
 ;; M-<jk> drag lines.
 ;; M-<hl> cannot demote/promote, we use it for "do-date".
 "J" 'org-agenda-priority-down
 "K" 'org-agenda-priority-up
 "H" 'org-agenda-do-date-earlier
 "L" 'org-agenda-do-date-later
 "t" 'org-agenda-todo
 "M-j" 'org-agenda-drag-line-forward
 "M-k" 'org-agenda-drag-line-backward
 "C-S-h" 'org-agenda-todo-previousset ; Original binding "C-S-<left>"
 "C-S-l" 'org-agenda-todo-nextset ; Original binding "C-S-<right>"

 ;; undo
 "u" 'org-agenda-undo

 ;; actions
 "dd" 'org-agenda-kill
 "dA" 'org-agenda-archive
 "da" 'org-agenda-archive-default-with-confirmation
 "ct" 'org-agenda-set-tags
 "ce" 'org-agenda-set-effort
 "cT" 'org-timer-set-timer
 "i" 'org-agenda-diary-entry
 "a" 'org-agenda-add-note
 "A" 'org-agenda-append-agenda
 "C" 'org-agenda-capture

 ;; mark
 "m" 'org-agenda-bulk-toggle
 "~" 'org-agenda-bulk-toggle-all
 "*" 'org-agenda-bulk-mark-all
 "%" 'org-agenda-bulk-mark-regexp
 "M" 'org-agenda-bulk-unmark-all
 "x" 'org-agenda-bulk-action

 ;; refresh
 "gr" 'org-agenda-redo
 "gR" 'org-agenda-redo-all

 ;; quit
 "ZQ" 'org-agenda-exit
 "ZZ" 'org-agenda-quit

 ;; display
 ;; "Dispatch" can prefix the following:
 ;; 'org-agenda-toggle-deadlines
 ;; 'org-agenda-toggle-diary
 ;; 'org-agenda-follow-mode
 ;; 'org-agenda-log-mode
 ;; 'org-agenda-entry-text-mode
 ;; 'org-agenda-toggle-time-grid
 ;; 'org-agenda-day-view
 ;; 'org-agenda-week-view
 ;; 'org-agenda-year-view
 "gD" 'org-agenda-view-mode-dispatch
 "ZD" 'org-agenda-dim-blocked-tasks

 ;; filter
 "sc" 'org-agenda-filter-by-category
 "sr" 'org-agenda-filter-by-regexp
 "se" 'org-agenda-filter-by-effort
 "st" 'org-agenda-filter-by-tag
 "s^" 'org-agenda-filter-by-top-headline
 "ss" 'org-agenda-limit-interactively
 "S" 'org-agenda-filter-remove-all

 ;; clock
 "I" 'org-agenda-clock-in ; Original binding
 "O" 'org-agenda-clock-out ; Original binding
 "cg" 'org-agenda-clock-goto
 "cc" 'org-agenda-clock-cancel
 "cr" 'org-agenda-clockreport-mode

 ;; go and show
 "." 'org-agenda-goto-today ; TODO: What about evil-repeat?
 "gc" 'org-agenda-goto-calendar
 "gC" 'org-agenda-convert-date
 "gd" 'org-agenda-goto-date
 "gh" 'org-agenda-holidays
 "gm" 'org-agenda-phases-of-moon
 "gs" 'org-agenda-sunrise-sunset
 "gt" 'org-agenda-show-tags

 "p" 'org-agenda-date-prompt
 "P" 'org-agenda-show-the-flagging-note

 ;; 'org-save-all-org-buffers ; Original binding "C-x C-s"

 ;; Others
 "+" 'org-agenda-manipulate-query-add
 "-" 'org-agenda-manipulate-query-subtract)


;; Hooks
(evil-set-initial-state 'org-agenda-mode 'motion)
