;; General 
(use-package general
  :ensure t
  :config
  ;; allow for shorter bindings such as nmap.
  (general-evil-setup t)

  ;; Prefix Constants 
  (defconst slk/evil-leader-global-prefix "SPC")
  (defconst slk/emacs-leader-global-prefix "M-SPC")
  (defconst slk/evil-leader-by-mode-prefix ",")
  (defconst slk/emacs-leader-by-mode-prefix "M-,")

  ;; Leader key 
  (general-create-definer leader-global
    :keymaps 'override
    :states '(normal visual motion emacs insert)
    :prefix slk/evil-leader-global-prefix
    :global-prefix slk/emacs-leader-global-prefix)

  ;; Leader key by mode (local) 
  (general-create-definer leader-by-mode
    :states '(normal visual motion emacs insert)
    :prefix slk/evil-leader-by-mode-prefix ; Evil 
    :global-prefix slk/emacs-leader-by-mode-prefix) ; Global

  )



