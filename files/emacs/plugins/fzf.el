;; fzf emacs 
(use-package fzf
  :ensure t
  :config
  (setq fzf/args "-x --no-hscroll --color=dark --print-query --no-multi --no-mouse --margin=1,0"
	fzf/position-bottom t)
  )

(defun whaler-switch ()
  (interactive)
   (fzf-with-command "find ~/personal ~/programming ~/notes -mindepth 1 -maxdepth 1 -type d" 'dired "/" )
   )
    

