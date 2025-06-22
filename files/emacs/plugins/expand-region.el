;; Its the same but without treesitter.
;; (use-package expand-region
;;   :ensure t
;;   :general
;;   (:keymaps 'override
;;             "M-q" 'er/expand-region
;;             )
;;   )


;; Its the same but requires treesiter.
(use-package expreg
  :ensure t
  :general
  (:keymaps 'override
            "C-q" 'expreg-expand
            )
  )
