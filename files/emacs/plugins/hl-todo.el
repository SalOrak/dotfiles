;; Highlight TODO and current line.
(use-package hl-todo
             :ensure t
             :config
             ;; Highlight TODO line
             (global-hl-todo-mode t)
             ;; Highligh current line
             (global-hl-line-mode t)
             )
