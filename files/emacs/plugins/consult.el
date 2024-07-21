 ;;; -*- lexical-binding: t; -*-

;; Consult 
;; Provides search and navigation commands.
(use-package consult
  :general
  (leader-global 'normal 'override
    "im" 'consult-imenu
    "ig"  'consult-imenu-multi
    ;; "ff" 'consult-fd
    "fr" 'consult-recent-file
    "yk" 'consult-yank-from-kill-ring
    "yy" 'consult-yank-pop
    "fg" 'consult-git-grep
    "bb" 'consult-buffer
    "bp" 'consult-project-buffer
    ;; "ss" 'consult-ripgrep
    "tm" 'consult-man
    "th" 'consult-info
    "tj" 'consult-theme)
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  ;; (setq completion-in-region-function
  ;;   (lambda (&rest args)
  ;;     (apply (if vertico-mode
  ;;   	     #'consult-completion-in-region
  ;;   	   #'completion--in-region)
  ;;   	 args)))
  (advice-add #'register-preview :override #'consult-register-window)
  :config
  (setq consult-project-function (lambda (_) (whaler-current-working-directory)))
  (setq consult-async-refresh-delay 0.2)
  (setq consult-async-input-throttle 0.2)
  (setq consult-async-min-input 2)
  (setq consult-async-split-style 'comma)
  )
