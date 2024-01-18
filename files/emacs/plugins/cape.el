;; Cape (Completion At Point Extensions)
;; The completion backends used by completion-at-point are so called completion-at-point-functions (Capf)
;; Registering cape-* functions in the completion-at-point-functions list makes the backends available for
;; completion.
(use-package cape
  :after corfu
  :init
  (add-to-list 'completion-at-point-functions #'cape-abbrev)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-file)
  )
