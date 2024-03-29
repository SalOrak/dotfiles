
;; Define plugins file list
(defvar salorak/plugins-list
  '(
    general
    hydra
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
    zoom
    dumb-jump
    shell-pop
    avy
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)

