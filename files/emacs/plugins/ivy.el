;; Ivy
;; Generic completion mechanism. 
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	enable-remote-dir-locals t
	ivy-initial-inputs-alist nil ;; Remove initial input in all comands
	;; (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "") ;; Remove initial input in counsel-M-x command (only)
	)
  )
