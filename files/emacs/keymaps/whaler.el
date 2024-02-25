;; Whaler keymaps
(leader-spc 'normal 'override
  "ff" 'salorak/whaler-find-files
  "ss" 'salorak/whaler-rg
  "sh" 'whaler
  "su" (lambda () (interactive)(whaler :change-cwd-auto nil))
  "fo" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-find-files))
  "so" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-search-strings ))
  "pv" 'salorak/whaler-dired-root
  "po" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'dired :action-arg t))
  "cc" 'salorak/whaler-compile
  "co" 'salorak/whaler-compile-other
  "wr" 'whaler-populate-projects-directories
  )


