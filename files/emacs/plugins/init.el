;; Define plugins file list
(defvar salorak/plugins-list
  '(
    general
    hydra
    emacs
    paredit
    move-text
    evil-nerd-commenter
    wgrep
    dired
    magit
    keycast
    hl-todo
    helpful
    which-key
    vertico
    consult
    marginalia
    corfu
    cape
    embark
    prescient
    multiple-cursors
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
