;;  Define custom hydras

;; Text Scaling
(defhydra hydra-zoom ()
  "Text Scaling"
  ("+" (lambda () (interactive) (text-scale-increase 1) ))
  ("-" (lambda () (interactive) (text-scale-decrease 1) ))
  ("=" (lambda () (interactive) (text-scale-adjust 0) ))
  )

(general-define-key
 :states '(emacs visual normal insert)
 :override t
 "C-z" 'hydra-zoom/body
 )

