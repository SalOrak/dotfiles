(use-package evil-nerd-commenter
  :ensure t
  :general
  (:keymaps 'override
            "M-;" 'evilnc-comment-or-uncomment-lines))
