;; General 
(use-package general
  :ensure t)

;; Leader key as space
(general-create-definer leader-global
  :prefix "SPC")

(general-create-definer leader-by-mode
  :prefix ","
  )


