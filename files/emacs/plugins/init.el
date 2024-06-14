
;; Define plugins file list
(defvar salorak/plugins-list
  '(
    m-x
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
    whaler
    doom-modeline
    org
    programming
    ffip
    ace-window
    zoom
    dumb-jump
    shell-pop
    avy
    lsp-mode
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)
