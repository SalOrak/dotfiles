(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?h ?t ?n ?s))
  (setq aw-dispatch-always t) ;; Action for 2 windows
  (setq aw-minibuffer-flag t)
  (setq aw-dispatch-alist
	'(
	  (?s aw-swap-window "Swap Windows")
	  (?m aw-move-window "Move Window")
	  (?c aw-copy-window "Copy Window")
	  (?b aw-switch-buffer-in-window "Select Buffer")
	  (?o aw-switch-buffer-other-window "Switch Buffer Other Window")
	  (?p aw-flip-window "Previous Window")
	  (?u aw-split-window-vert "Split Window Upwards")
	  (?l aw-split-window-horz "Split Window to Left")
	  (?k aw-delete-window "Kill Window")
	  (?d delete-other-windows "Delete Other Windows")
	  (?? aw-show-dispatch-help))
	)
  )
