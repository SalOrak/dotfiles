(use-package emamux
  :config
  (defhydra hydra-tmux ()
    "Tmux Management"
    ("s" emamux:send-command "Send Command")
    ("y" emamux:yank-from-list-buffers "Yank from Tmux")
    ("w" emamux:new-window "New Window")
    ("c" emamux:close-runner-pane "Close current pane")
    ("C" emamux:close-panes "Close ALL panes")
    )
  )
