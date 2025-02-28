;; Provides some interactive functions which allows users to transpose windows arrangement in currently selected frame.
(use-package transpose-frame
  :ensure t
  :general
  (leader-global 
    "w" 'hydra-transpose-frames/body :wk "Window Transpose" ;; Window Transpose 
    )

  :config
  ;; Hydra for window transposing frames, i.e changing the layout of the frames
  (defhydra hydra-transpose-frames (:columns 2 :color red)
    "Transpose Buffer Frames"
    ("h" (lambda () (interactive)(shrink-window-horizontally 10)) "shrink horizontal")
    ("l" (lambda () (interactive)(enlarge-window-horizontally 10)) "enlarge horizontal")
    ("j" (lambda () (interactive)(shrink-window 10)) "shrink vertical")
    ("k" (lambda () (interactive)(enlarge-window 10)) "enlarge vertical")
    ("b" balance-windows "[B]alance Windows")
    ("s" transpose-frame "[S]wap X and Y direction")
    ("r" rotate-frame "[R]otate frame 180 degrees")
    ("c" rotate-frame-clockwise "Rotate [C]lockwise")
    ("q" nil "[q]uit")
    )
  )
