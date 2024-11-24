;; Provides some interactive functions which allows users to transpose windows arrangement in currently selected frame.
(use-package transpose-frame
  :ensure t
  :general
  (leader-global 
    "wf" 'hydra-transpose-frames/body ;; Window Transpose 
    )

  :config
  ;; Hydra for window transposing frames, i.e changing the layout of the frames
  (defhydra hydra-transpose-frames (:columns 3 :color red)
    "Transpose Buffer Frames"
    ("s" transpose-frame "[S]wap X and Y direction")
    ("v" flip-frame "Flip frames [V]ertically")
    ("h" flop-frame "Flip frames [H]orizontally")
    ("r" rotate-frame "[R]otate frame 180 degrees")
    ("c" rotate-frame-clockwise "Rotate 90 degrees [C]lockwise")
    ("a" rotate-frame-anticlockwise "Rotate 90 degrees [A]ntiClockwise")
    ("q" nil "[q]uit")
    )
  )
