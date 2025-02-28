(use-package hydra
  :general
  (leader-global
    "z" 'hydra-zoom/body)
  :ensure t
  :config
  (defun sk/increase-font-size ()
    "Increase font size for all buffers"
    (set-face-attribute 'default nil :height (+ (face-attribute 'default :height) 10)))
  (defun sk/decrease-font-size ()
    "Decrease font size for all buffers"
    (set-face-attribute 'default nil :height (- (face-attribute 'default :height) 10)))
  
  ;; Hydras definitions
  (defhydra hydra-zoom ()
    "Text Scaling"
    ("+" (lambda () (interactive) (text-scale-increase 1)))
    ("-" (lambda () (interactive) (text-scale-decrease 1)))
    ("u" (lambda () (interactive) (sk/increase-font-size)))
    ("d" (lambda () (interactive) (sk/decrease-font-size)))
    ("=" (lambda () (interactive) (text-scale-adjust 0) ))
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
  )

