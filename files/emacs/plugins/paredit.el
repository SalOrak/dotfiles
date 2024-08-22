(use-package paredit
  :ensure t
  :init
  (defun sk/turn-paredit-mode-on ()
    "Turn paredit mode ON"
    (interactive)
    (paredit-mode 1))
  (general-add-hook 'emacs-lisp-mode-hook #'sk/turn-paredit-mode-on)
  (general-add-hook 'lisp-interaction-mode-hook #'sk/turn-paredit-mode-on)
  (general-add-hook 'common-lisp-mode-hook #'sk/turn-paredit-mode-on))
  
