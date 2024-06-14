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
  ("h" shrink-window-horizontally "shrink horizontal")
  ("l" enlarge-window-horizontally "enlarge horizontal")
  ("j" shrink-window "shrink vertical")
  ("k" enlarge-window "enlarge vertical")
  ("b" balance-windows "[B]alance Windows")
  ("q" nil "[q]uit")
  )

(leader-spc 'normal 'override
  "r" 'hydra-window-size/body ;; Window resize
  )
