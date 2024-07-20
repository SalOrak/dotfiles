;; Whaler keymaps -- Consult Version 
(leader-global 'normal 'override
  "sc" 'salorak/whaler-async-shell
  "s." 'salorak/whaler-async-shell-other
  "sh" 'whaler
  "so" 'salorak/whaler-other
  "pv" 'salorak/whaler-dired-root
  "po" 'salorak/whaler-dired-root-other
  "cc" 'salorak/whaler-compile
  "co" 'salorak/whaler-compile-other
  "ff" 'salorak/whaler-consult-find-files 
  "fo" 'salorak/whaler-consult-find-files-other
  "ss" 'salorak/whaler-consult-search-string
  "su" 'salorak/whaler-consult-search-string-other
  "wr" 'whaler-populate-projects-directories
  )
