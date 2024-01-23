;; Whaler keymaps
(leader-spc 'normal 'override
  "ff" 'salorak/whaler-find-files
  "ss" 'salorak/whaler-rg
  "ww" 'whaler-whaler
  "pv" 'salorak/whaler-dired-root
  "po" (lambda () (interactive)(whaler-whaler :change-cwd-auto nil))
  "pc" 'salorak/whaler-compile
  "wr" 'whaler-populate-projects-directories
  )
