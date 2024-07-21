;; Evil Mode
(use-package evil
             :after undo-fu
             :ensure t
             :general
             (:states 'normal :keymaps 'override
                      ":" 'evil-command-window-ex
                      )
             :init
             (setq evil-want-keybinding nil)
             (setq evil-want-C-u-scroll t)
             (setq evil-undo-system 'undo-fu)
             (setq evil-want-empty-ex-last-command nil)
             :hook
             ;; Insert mode in Vi command line window
             (evil-command-window-mode . evil-insert-state)
             ;;  << Same as this>>
             ;; (add-hook 'evil-command-window-mode-hook  'evil-insert-state) 
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

;; Evil Commenter
(use-package evil-nerd-commenter
  :after evil
  :bind ( "M-;" . 'evilnc-comment-or-uncomment-lines)
  :ensure t
  )

;; (use-package evil-org
;;   :ensure t
;;   :after org
;;   :hook (org-mode . (lamda () evil-org-mode))
;;   :config
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys)
;;   )
