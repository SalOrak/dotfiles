(use-package move-text
  :ensure t
  :general
  (:keymaps 'override
            "M-p" 'move-text-up
            "M-<up>" 'move-text-up
            "M-<down>" 'move-text-down
            "M-n" 'move-text-down
            )
  )
