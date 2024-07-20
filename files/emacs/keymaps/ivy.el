;;  Ivy keybinds

(leader-global 'normal 'override
  "i" 'counsel-imenu
  ;; "nu" 'counsel-org-capture ; Normal capture
  "fr" 'counsel-buffer-or-recentf
  "fg" 'counsel-git-grep
  "bb" 'counsel-switch-buffer
  "bo" 'counsel-switch-buffer-other-window
  "yy" 'counsel-yank-pop
  "yd" 'counsel-mark-ring
  "tj" 'salorak/load-theme
  "ta" 'counsel-org-tag
  "eg" 'counsel-org-agenda-headlines
  "ee" 'counsel-org-entity
  "el" 'counsel-org-link
  "hk" 'counsel-descbinds
  "hf" 'counsel-describe-function
  "hv" 'counsel-describe-variable
  "hs" 'counsel-describe-symbol
  "gw" 'counsel-git-change-worktree
  )
 
(defhydra hydra-windows-harpoon (:columns 1 :exit t)
  "Windows Harpoon"
  ("a" ivy-push-view "Add")
  ("d" ivy-pop-view "Delete")
  ("m" ivy-switch-view "Menu")
  )

(general-define-key
 :keymaps '(normal visual)
 :override t
 "M-," 'hydra-windows-harpoon/body 
 )

;; ;;  Harpoon M- style commands
;; (general-define-key
;;  :keymaps '(normal visual)
;;  :override t
;;  "M-," 'ivy-push-view ;; Harpoon add
;;  "M-p" 'ivy-pop-view ;; Harpoon delete
;;  "M-m" 'ivy-switch-view ;; Harpoon menu
;;  )

(general-define-key
 :keymaps '(normal visual)
 "/" 'swiper
 )
