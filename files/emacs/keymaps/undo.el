;; Undo keymaps
(general-define-key
 :keymaps '(undo-tree-visualizer-mode-map)
 :state '(normal visual)
 :override t
 "o" 'ace-window
 "u" 'undo-tree-visualizer-toggle-timestamps
 "d" 'undo-tree-visualizer-toggle-diff
 )
