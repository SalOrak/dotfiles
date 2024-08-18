;; Ivy
;; Generic completion mechanism. 
(use-package ivy
  :config
  (ivy-mode 1)
  (setq
   ivy-use-virtual-buffers nil
   ivy-display-style 'fancy
   enable-remote-dir-locals t
   ivy-magic-slash-non-match-action 'ivy-magic-slash-non-match-create
   ivy-initial-inputs-alist nil ;; Remove initial input in all comands
   ivy-use-selectable-prompt t ;; Prompt can be selected
   ivy-count-format "[%d | %d] "
   ivy-wrap nil
	;; (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "") ;; Remove initial input in counsel-M-x command (only)
	)

  ;; Hydra definition
  (defhydra hydra-windows-harpoon (:columns 1 :exit t)
    "Windows Harpoon"
    ("a" ivy-push-view "Add")
    ("d" ivy-pop-view "Delete")
    ("m" ivy-switch-view "Menu"))
  )
