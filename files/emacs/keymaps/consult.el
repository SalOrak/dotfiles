;; Consult keymaps

(leader-global 'normal 'override
  "im" 'consult-imenu
  "ig"  'consult-imenu-multi
  "ff" 'consult-fd
  "fr" 'consult-recent-file
  "yk" 'consult-yank-from-kill-ring
  "yy" 'consult-yank-pop
  "fg" 'consult-git-grep
  "bb" 'consult-buffer
  "bp" 'consult-project-buffer
  "ss" 'consult-ripgrep
  "tm" 'consult-man
  "th" 'consult-info
  "tj" 'consult-theme
  )
