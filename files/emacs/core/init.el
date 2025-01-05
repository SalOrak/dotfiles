
;; Define core files to load
(defvar sk/core-list
  '(
    path
    ui
    themes
    colorscheme
	text
    )
  )

;; Load core plugins list
(sk/load-plugins sk/core-list 'core)
