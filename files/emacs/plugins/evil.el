;; Evil Mode
(use-package evil
  :after undo-fu
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-empty-ex-last-command nil)
  :config
  (evil-mode 1))

;; Evil Collection
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Evil Surrounding (as surround.vim)
(use-package evil-surround
             :after evil
             :ensure t
             :config
             (global-evil-surround-mode 1))

;; Evil Commenter
(use-package evil-nerd-commenter
  :after evil
  :bind ( "M-;" . 'evilnc-comment-or-uncomment-lines)
  :ensure t
  )
 
