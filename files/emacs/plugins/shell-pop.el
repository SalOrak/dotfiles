;; Helps use shell easily on Emacs.
(use-package shell-pop
  :ensure t
  :custom

  (shell-pop-shell-type '("term" "*term*" (lambda nil (term shell-pop-term-shell))))
  (shell-pop-term-shell "/bin/bash --login -c 'tmux new-session -A -s emacs'") 
  (shell-pop-default-directory "~")
  (shell-pop-window-position "right")
  (shell-pop-window-size 40)
  (shell-pop-autocd-to-working-dir nil)
  (shell-pop-universal-key "M-t")
  (shell-pop-full-span t)
  )


