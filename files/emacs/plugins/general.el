;; General 
(use-package general
  :ensure t
  :config

  ;; Prefix Constants 
  (defconst slk/emacs-leader-global-prefix "M-SPC")
  (defconst slk/emacs-leader-by-mode-prefix "M-,")

  ;; Leader key 
  (general-create-definer leader-global
    :keymaps 'override
    :states '(normal visual motion emacs insert)
    :global-prefix slk/emacs-leader-global-prefix)

  ;; Leader key by mode (local) 
  (general-create-definer leader-by-mode
    :states '(normal visual motion emacs insert)
    :global-prefix slk/emacs-leader-by-mode-prefix) ; Global

  )



