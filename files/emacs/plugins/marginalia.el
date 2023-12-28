;; Marginalia
;; Add rich annotation in the minibuffer: keybind + summary
(use-package marginalia
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode)
  :ensure t
  :config
  )
