;; General 
(use-package general
  :ensure t
  :demand t
  :config

  (general-auto-unbind-keys)

  ;; Prefix Constants 
  (defconst sk/emacs-leader-global-prefix "C-c")
  (defconst sk/emacs-leader-by-mode-prefix "C-,")

  ;; Leader key 
  (general-create-definer leader-global
    :keymaps 'override
    :prefix sk/emacs-leader-global-prefix)

  ;; Leader key by mode (local) 
  (general-create-definer leader-by-mode
    :prefix sk/emacs-leader-by-mode-prefix) ; Global
  )
