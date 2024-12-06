;; Define plugins file list
(defvar salorak/plugins-list
  '(
    general
    hydra
    emacs
    undo
    ;; god
    ;; paredit
    move-text
    evil-nerd-commenter
    wgrep
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
    embark
    orderless
    ;; prescient
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
    latex
    free-keys
    yasnippet
    ;; lsp-mode
    vterm
    translate
    )
  )

;; LOAD plugins list
(salorak/load-plugins salorak/plugins-list 'plugins)
