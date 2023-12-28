;; Move minibuffer to the middle of the screen
;; Replicates Telescope 
(use-package mini-frame
  :ensure t
  :custom 
  (mini-frame-show-parameters '((top . 0.3) (width . 0.7) (left . 0.5)))
  :config
  (mini-frame-mode)
  )

;;  Custom set variables
 ;; '(mini-frame-show-parameters '((top . 0.3) (width . 0.7) (left . 0.5)))
