;; Define plugins file list
(defvar salorak/plugins-list
  '(
    ;; m-x
    general
    hydra
    emacs
    dired
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
    tools
    whaler
    org
    org-roam
    programming
    ace-window
    transpose-frame
    dumb-jump
    avy
    lsp-mode
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)
