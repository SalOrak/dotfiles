;; Highlight TODO and current line.
(use-package hl-todo
             :ensure t
             :config
             ;; Highlight TODO line
             (global-hl-todo-mode t)
             ;; Highligh current line
             (global-hl-line-mode t)

             (defun sk/hl--disable-line-mode ()
               "Disable highlight line mode for the current buffer"
               (set (make-local-variable 'global-hl-line-mode) nil)
               )
             (add-hook 'vterm-mode-hook #'sk/hl--disable-line-mode)
             (add-hook 'vterm-copy-mode-hook #'sk/hl--disable-line-mode)
             )
