;; Consult keymaps

(my-leader-def 'normal 'override
  "bb" 'consult-buffer
  "ss" 'consult-ripgrep
  "fg" 'consult-git-grep
  "tm" 'consult-man
  "th" 'consult-info
  )
