;; Show free keybindings for modkeys or prefixes.
(use-package free-keys
  :ensure t
  :demand t
  :general
  (leader-global :keymaps 'override
    "k" 'free-keys)
  )
