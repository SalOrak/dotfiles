;; Open Terminal on M-t.
(general-define-key
 :states '(emacs visual normal insert)
 :override t
 "M-t" 'shell-pop
 )
