(use-package lsp-mode
  :init 
  ;; set prefix for lsp-command-keymap
  (setq lsp-keymap-prefix "C-c l")
  :hook ( ;; replace XXX-mode with major-mode (python-mode)
         (lua-mode . lsp)
         (go-mode . lsp)
         (rust-mode . lsp)
         )
  :commands lsp
  )


(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

