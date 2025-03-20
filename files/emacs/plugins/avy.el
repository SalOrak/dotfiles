(use-package avy
  :general
  ("C-;" 'avy-goto-char-timer) ;; Go to char by timing.
  :ensure t
  :config
  (defun sk/avy-action--register ()
    "Returns REGISTER used for custom avy-actions"
    ?V)

  (defun sk/avy-action-helpful (pt)
    "Show HELP for symbol at PT"
    (save-excursion
      (goto-char pt)
      (helpful-at-point)))

  (defun sk/avy--point-at-first-non-whitespace (pt)
    "Returns point at first non-whitespace"
    (save-excursion
      (goto-char pt)
      (back-to-indentation)
      (point)))

  (defun sk/avy-action-find-file (pt)
    "Finds file at point PT."
    (save-excursion
      (goto-char pt)
      (find-file-at-point)))

  
  (defun sk/avy-action-xref-word (pt)
    "Finds XREF at word in point PT."
    (save-excursion
      (goto-char pt)
      ;; (xref-find-definitions pt)))
      (xref-find-definitions (current-word))))


  (defun sk/avy-action-find-function (pt)
    "Finds function at point PT."
    (save-excursion
      (goto-char pt)
      (find-function-at-point)))
  
  (defun sk/avy-action-mark-region (pt)
    "Put MARK after PT and activate region"
    (activate-mark)
    (goto-char (+ pt 1)) ; Select the char at PT
    )

  (defun sk/avy-action-copy-line-stay (pt)
    "Copy and yank line at PT and stay."
    (let (
          (current-register (get-register (sk/avy-action--register))))
      (save-excursion
        (goto-char pt)
        (copy-to-register (sk/avy-action--register) (sk/avy--point-at-first-non-whitespace pt) (line-end-position)))
      (select-window
       (cdr
        (ring-ref avy-ring 0)))
      (insert-register (sk/avy-action--register))
      (set-register (sk/avy-action--register) current-register)))

  (setq avy-background t)
  (setq avy-keys '(?q ?w ?e ?p ?o ?i))
  (setq avy-timeout-seconds 0.4)
  (setq avy-enter-times-out nil)
  (setq avy-style 'at-full)
  (setq avy-single-candidate-jump nil) ;; Don't automatically jump.
  (setq avy-all-windows 'all-frames) ;; All windows
  (setq avy-dispatch-alist '(
                             (?k . avy-action-kill-move)
                             (?K . avy-action-kill-stay)
                             (?m . sk/avy-action-mark-region)
                             (?y . avy-action-yank)
                             (?l . sk/avy-action-copy-line-stay)
                             (?z . avy-action-zap-to-char)
                             (?. .  sk/avy-action-xref-word)
                             (?f . sk/avy-action-find-function)
                             (?H . sk/avy-action-helpful)
                             ))
  )

