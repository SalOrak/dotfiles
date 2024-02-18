;; Vi command line as a window
(general-define-key
 :states 'normal
 :keymaps 'override
 ":" 'evil-command-window-ex
 )

;; Insert mode in Vi command line window
(add-hook 'evil-command-window-mode-hook  'evil-insert-state)
