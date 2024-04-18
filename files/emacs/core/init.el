
;; Define core files to load
(defvar salorak/core-list
  '(
    ui
    colorscheme
	text
    )
  )

;; Load core plugins list
(salorak/load-plugins salorak/core-list 'core)
