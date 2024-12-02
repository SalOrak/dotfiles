(use-package multiple-cursors
  :ensure t
  :general
  (:keymaps 'override
    "C-S-c C-S-c" 'mc/edit-lines
    "C->" 'mc/mark-next-like-this
    "C-<" 'mc/mark-previous-like-this
    ;; "C-\\" 'mc/skip-to-next-like-this
    ;; "C-~" 'mc/skip-to-previous-like-this
    "C-c C-<" 'mc/mark-all-like-this
    "C-c C->" 'mc/mark-all-like-this
    )
  )
