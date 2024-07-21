;; Undo-fu (Undo-Tree)
(use-package undo-fu
             :ensure t)

(use-package undo-tree
  :disabled
  :ensure t
  :general
  (:keymaps '(undo-tree-visualizer-mode-map)
            :state '(normal visual)
            :override t
            "o" 'ace-window
            "u" 'undo-tree-visualizer-toggle-timestamps
            "d" 'undo-tree-visualizer-toggle-diff
            )
  :hook (undo-tree-visualizer-mode . evil-normal-state)
  :init
  (global-undo-tree-mode)
  )
