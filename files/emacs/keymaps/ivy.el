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
  "tj" 'counsel-load-theme
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

;; Org only commands
(leader-global
  :keymaps 'org-mode-map
  :states 'normal
  "em" 'counsel-org-goto
  )
 
(defhydra hydra-harpoon (:columns 1 :exit t)
  "Harpoon"
  ("a" ivy-push-view "Add")
  ("d" ivy-pop-view "Delete")
  ("m" ivy-switch-view "Menu")
  )

(general-define-key
 :keymaps '(normal visual)
 :override t
 "M-," 'hydra-harpoon/body 
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
