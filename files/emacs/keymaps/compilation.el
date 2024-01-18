

;; Compilation mode keybindings 
(general-define-key
 :keymaps '(compilation-mode-map)
 :states '(normal visual)
 "n" 'compilation-next-error
 "p" 'compilation-previous-error
 )
