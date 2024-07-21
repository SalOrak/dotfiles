;; Zoom window like tmux zoom
(use-package zoom-window
  :ensure t  
  :general
  (:states '(emacs visual normal insert) :keymaps 'override
   "M-z" 'zoom-window-zoom
   )
  )
