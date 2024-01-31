;; Undo-fu (Undo-Tree)
(use-package undo-fu
             :ensure t)

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  )
