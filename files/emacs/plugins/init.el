
;; Define plugins file list
(defvar salorak/plugins-list
  '(
    ;; m-x
    general
    hydra
    emacs
    dired
    undo
    evil
    magit
    hl-todo
    helpful
    which-key
    vertico
    consult
    marginalia
    corfu
    cape
    prescient
    ;; ivy
    ;; counsel
    tools
    ;; projectile
    whaler
    doom-modeline
    org
    org-roam
    org-agenda
    programming
    ;; ffip
    ace-window
    transpose-frame
    zoom
    dumb-jump
    shell-pop
    avy
    ;; restclient
    lsp-mode
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)
