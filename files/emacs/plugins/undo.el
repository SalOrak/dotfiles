;; Simple, stable linear undo with redo for Emacs.
(use-package undo-fu
  :ensure t
  :general
  (:keymaps 'override
            "C-\\" 'undo-fu-only-undo
            "C-/" 'undo-fu-only-redo)
  )


;; Visual Undo (Vundo)
;; Displays the undo history as a tree and lets
;; move in the tree to go back to previous buffer states.
(use-package vundo
  :ensure t
  :config
  (setq  vundo-glyph-alist vundo-unicode-symbols) ;; Prettier Vundo tree
  :general
  (leader-global :keymaps 'override
    "v" 'vundo)
  )
