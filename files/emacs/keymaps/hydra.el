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

;; Hydra for window resizing
(defhydra hydra-window-size (:columns 2 :color red)
  "Windows size"
  ("h" (lambda () (interactive)(shrink-window-horizontally 10)) "shrink horizontal")
  ("l" (lambda () (interactive)(enlarge-window-horizontally 10)) "enlarge horizontal")
  ("j" (lambda () (interactive)(shrink-window 10)) "shrink vertical")
  ("k" (lambda () (interactive)(enlarge-window 10)) "enlarge vertical")
  ("b" balance-windows "[B]alance Windows")
  ("q" nil "[q]uit")
  )

(leader-spc 'normal 'override
  "r" 'hydra-window-size/body ;; Window resize
  )


