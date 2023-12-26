;; Evil Mode
(use-package evil
             :init 
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             (setq evil-undo-system 'undo-fu)

             :ensure t
             :config
             (evil-mode 1))

;; Evil Collection 
(use-package evil-collection
             :after evil
             :ensure t
             :config
             (setq evil-want-integration t)
             (evil-collection-init))

;; Evil Surrounding (as surround.vim)
(use-package evil-surround
             :after evil
             :ensure t
             :config
             (global-evil-surround-mode 1))
