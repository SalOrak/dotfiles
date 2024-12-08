(use-package vterm
  :config
  (use-package vterm-toggle
    :init
    (defun sk/vterm-toggle-insert-root-directory ()
      "Cd to the root of the current Whaler project."
      (interactive)
      (if (eq major-mode 'vterm-mode)
          (let ((cd-command (format "cd %s" whaler-current-working-directory)))
            (vterm-send-string cd-command)
            (vterm-send-return)
            )))

    (defun sk/vterm-toggle-insert-whaler ()
      "Execute whaler.sh inside the terminal"
      (interactive)
      (if (eq major-mode 'vterm-mode)
          (let ((cd-command "source $(which whaler.sh)")) 
            (vterm-send-string cd-command)
            (vterm-send-return)
            ))
      )
    :general
    (leader-global :keymaps 'override
      "C-t" 'vterm-toggle
      ;; "" 'vterm-toggle-cd
      )

    (leader-by-mode :keymaps '(vterm-mode-map vterm-copy-mode-map)
      "cs" 'sk/vterm-toggle-insert-root-directory
      "cd" 'vterm-toggle-insert-cd
      "C-s" 'sk/vterm-toggle-insert-whaler
      "v" 'vterm-copy-mode
      )

    (:keymaps '(vterm-copy-mode-map)
              "n" 'next-line
              "p" 'previous-line
              "q" 'vterm-copy-mode
              "]" 'forward-paragraph
              "[" 'backward-paragraph
              )

    :config
    ;; Variable configuration
    (setq vterm-toggle-hide-method 'reset-window-configration)
    (setq vterm-toggle-scope 'project)
    (setq vterm-toggle-project-root t)
    (setq vterm-toggle-cd-auto-create-buffer t)
    
    ;; Advice to use Whaler as the root project directory
    (defun sk/vterm--project-root-advice (orig-fun)
      "Advice to use Whaler for the root of the project"
      whaler-current-working-directory)
    (advice-add 'vterm-toggle--project-root :around #'sk/vterm--project-root-advice)
    )
  )

