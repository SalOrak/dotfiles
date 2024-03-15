;; Whaler keymaps
(leader-spc 'normal 'override
  "sh" 'whaler
  "pv" 'salorak/whaler-dired-root
  "ff" 'salorak/whaler-find-files
  "ss" 'salorak/whaler-rg
  "cc" 'salorak/whaler-compile
  "su" (lambda () (interactive)(whaler :change-cwd-auto nil))
  "po" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'dired :action-arg t))
  "fo" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-find-files))
  "so" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-search-strings ))
  "co" (lambda () (interactive)(whaler :change-cwd-auto nil :action 'salorak/whaler-compile-other :action-arg nil))
  "wr" 'whaler-populate-projects-directories
  )


