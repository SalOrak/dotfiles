;; Cape (Completion At Point Extensions) -*-lexical-binding: t -*-
;; The completion backends used by completion-at-point are so called completion-at-point-functions (Capf)
;; Registering cape-* functions in the completion-at-point-functions list makes the backends available for
;; completion.

(use-package cape
  :after corfu
  :bind ("C-c p" . cape-prefix-map)
  :init
  (add-hook 'completion-at-point-functions #'cape-abbrev)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-keyword)
  (add-hook 'completion-at-point-functions #'cape-file)
  )

(defun salorak/compile (prompt)
  "Prompt for a compile command with Corfu-enabled autocompletion and custom prefix"
  (interactive)
  ;; Prompt for the compile command with Corfu enabled in the minibuffer
  (setq compile-command
        (minibuffer-with-setup-hook
            (lambda ()
                (setq-local completion-at-point-functions
                            (list
                             #'cape-file
                             #'cape-history))
                (corfu-mode 1))
          (read-from-minibuffer prompt
                                (eval compile-command)
                                nil nil 'compile-history (eval compile-command))))
  (setq compilation-directory default-directory)
  ;; Call the compile function interactively
  (unwind-protect
      (compilation-start compile-command)))

(defun salorak/compile--rename-buffer (prompt)
  ""
  (let
      ((compilation-buffer (get-buffer "*compilation*"))
       (new-buffer-name (concat "*" (f-filename default-directory) "-compilation*")))
    (when compilation-buffer
      (with-current-buffer compilation-buffer
        (when (buffer-live-p (get-buffer new-buffer-name))
           (kill-buffer (get-buffer new-buffer-name)))
        (rename-buffer new-buffer-name)))))

(advice-add 'salorak/compile :after #'salorak/compile--rename-buffer)

