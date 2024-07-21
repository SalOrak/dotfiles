;; Cape (Completion At Point Extensions)
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
