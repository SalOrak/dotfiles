;; Define plugins file list
(defvar sk/plugins-list
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
    orderless
    multiple-cursors
    tools
    whaler
    org
    org-roam
    programming
    transpose-frame
    dumb-jump
    avy
    latex
    free-keys
    yasnippet
    tmr
    imenu
    modeline
    )
  )

;; LOAD plugins list
(sk/load-plugins sk/plugins-list 'plugins)
