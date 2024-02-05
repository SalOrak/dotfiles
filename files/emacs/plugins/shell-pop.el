;; Helps use shell easily on Emacs.
(use-package shell-pop
  :ensure t
  :custom
  (setq shell-pop-default-directory "~")
  (setq shell-window-pop-position "bottom")
  (setq shell-pop-autocd-to-working-dir nil)
  )

