;; Consult keymaps

(leader-spc 'normal 'override
  "ff" 'consult-fd
  "bb" 'consult-buffer
  "ss" 'consult-ripgrep
  "fg" 'consult-git-grep
  "tm" 'consult-man
  "th" 'consult-info
  )

