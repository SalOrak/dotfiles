;; Undo-fu (Undo-Tree)
(use-package undo-fu
             :ensure t)

(use-package undo-tree
  :ensure t
  :hook (undo-tree-visualizer-mode . evil-normal-state)
  :init
  (global-undo-tree-mode)
  )
