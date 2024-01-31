
;; Define plugins file list 
(defvar salorak/plugins-list
  '(
    general
    undo
    evil
    magit
    hl-todo
    helpful
    ;; vertico
    ;; consult
    marginalia
    corfu
    cape
    ivy
    counsel
    tools
    ;; projectile
    doom-modeline
    org
    programming
    whaler
    ffip
    ace-window
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)

