
;; Define plugins file list 
(defvar salorak/plugins-list
  '(
    general
    undo-fu
    evil
    magit
    hl-todo
    helpful
    ;; vertico
    ;; consult
    marginalia
    corfu
    ivy
    counsel
    tools
    projectile
    doom-modeline
    org
    programming
    )
  )

;; Load plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)

