(use-package fzf
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x \
                      --color='bg:237,bg+:236,info:143,border:240,spinner:108'\                     --color='hl:65,fg:252,header:65,fg+:252' \                       --color='pointer:161,marker:168,prompt:110,hl+:108' \ 
 --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "rg -files --hidden"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))
