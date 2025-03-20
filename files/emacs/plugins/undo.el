;; Simple, stable linear undo with redo for Emacs.
(use-package undo-fu
  :ensure t
  :general
  (:keymaps 'override
            "C-\\" 'undo-fu-only-undo
            "C-/" 'undo-fu-only-redo))
