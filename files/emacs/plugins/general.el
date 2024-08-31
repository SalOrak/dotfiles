;; General 
(use-package general
  :ensure t
  :config

  ;; Prefix Constants 
  (defconst slk/emacs-leader-global-prefix "C-c")
  (defconst slk/emacs-leader-by-mode-prefix "C-;")

  ;; Leader key 
  (general-create-definer leader-global
    :keymaps 'override
    :prefix slk/emacs-leader-global-prefix)

  ;; Leader key by mode (local) 
  (general-create-definer leader-by-mode
    :prefix slk/emacs-leader-by-mode-prefix) ; Global
  )



