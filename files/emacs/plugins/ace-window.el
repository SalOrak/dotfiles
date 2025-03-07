(use-package ace-window
  :general
  ;; (:keymaps 'override
  ;;           "M-." 'ace-window
  ;;           )
  :ensure t
  
  :init
  (defun sk/aw-kill-buffer (window)
    "Kill the buffer of the selected window using `ace-window'"
    (aw-delete-window window t))
  (defun sk/aw-consult-switch-buffer (window)
    "Switch the buffer of the selected window using `ace-window' ala `consult-buffer'"
    (aw-switch-to-window window)
    (consult-buffer))
  
  :config
  (setq aw-keys '(?h ?t ?n))
  (setq aw-dispatch-always t) ;; Action for 2 windows
  (setq aw-minibuffer-flag t)
  (setq aw-dispatch-alist
	    '(
	      (?m aw-swap-window "[M]ove")
	      (?c aw-copy-window "[C]opy")
	      (?b sk/aw-consult-switch-buffer "Switch [B]uffer")
	      (?u aw-split-window-vert "Split Upwards")
	      (?s aw-split-window-horz "Split Left")
	      (?w aw-delete-window "Kill [W]indow")
	      (?k sk/aw-kill-buffer "[K]ill Buffer")
	      (?d delete-other-windows "[D]elete Other Windows")
	      (?? aw-show-dispatch-help))
	    )
  )

