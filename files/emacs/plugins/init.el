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
    counsel
    marginalia
    corfu
    cape
    orderless
    multiple-cursors
    tools
    fzf
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
    expand-region
    visiblemark
    )
  )

;; LOAD plugins list
(sk/load-plugins sk/plugins-list 'plugins)
