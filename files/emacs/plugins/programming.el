(use-package php-mode)
(use-package tide
  :ensure t
  :general
  (leader-by-mode :keymaps 'typescript-mode-map
    "c" 'tide-compile-file
    "d" 'tide-documentation-at-point
    "r" 'tide-rename-symbol
    "j" 'tide-jump-to-definition
    )
  :config
  (defun sk/setup-tide-mode()
    (interactive)
    (tide-setup)
    (tide-hl-identifier-mode +1)

    )
  (add-hook 'typescript-mode-hook #'sk/setup-tide-mode)
    )

(use-package go-mode)
(use-package rust-mode)
(use-package haskell-mode)
(use-package lua-mode)
(use-package kotlin-mode)
(use-package markdown-mode)
(use-package yaml-mode)
(use-package typescript-mode)

(use-package elpy
  :ensure t
  :init
  (elpy-enable))




