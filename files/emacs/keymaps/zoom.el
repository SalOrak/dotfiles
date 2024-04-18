;; Zoom window like tmux
(general-define-key
 :states '(emacs visual normal insert)
 :override t
 "M-z" 'zoom-window-zoom
 )
