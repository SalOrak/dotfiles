(use-package fzf
  :general
  (leader-global
    "x" 'fzf)
  :config
  (setq fzf/args "-e --color dark --print-query --margin=1,0 --no-hscroll --bind 'ctrl-n:down,ctrl-p:up,ctrl-a:beginning-of-line,ctrl-e:end-of-line,ctrl-f:forward-char,ctrl-b:backward-char,alt-f:forward-word,alt-b:backward-word,ctrl-k:kill-line,alt-d:kill-word,ctrl-k:kill-line,ctrl-d:delete-char,ctrl-m:accept,ctrl-g:abort,alt-a:first,alt-e:last,ctrl-y:replace-query' --color=fg:#a0a0a0,bg:#121212,hl:#eb9421 --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff --color=info:#afaf87,prompt:#eb9421,pointer:#eb9421 --color=marker:#87ff00,spinner:#ffd08a,header:#ffd08a"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "rg -files --hidden"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))
