
;; Define core files to load
(defvar salorak/core-list
  '(
    ui
    colorscheme
    )
  )

;; Load core plugins list
(salorak/load-plugins salorak/core-list 'core)
