;; Whaler keymaps
(leader-spc 'normal 'override
  "ff" 'salorak/whaler-find-files
  "ss" 'salorak/whaler-rg
  "sh" 'whaler-whaler
  "so" (lambda () (interactive)(whaler-whaler :change-cwd-auto nil))
  "pv" 'salorak/whaler-dired-root
  "cc" 'salorak/whaler-compile
  "wr" 'whaler-populate-projects-directories
  )
