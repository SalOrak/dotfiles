;;  Ivy keybinds

(leader-spc 'normal 'override
  "i" 'counsel-imenu
  ;; "nu" 'counsel-org-capture ; Normal capture
  "fr" 'counsel-buffer-or-recentf
  "fg" 'counsel-git-grep
  "bb" 'counsel-switch-buffer
  "bo" 'counsel-switch-buffer-other-window
  "yy" 'counsel-yank-pop
  "yd" 'counsel-mark-ring
  "tj" 'counsel-load-theme
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
(leader-spc
  :keymaps 'org-mode-map
  :states 'normal
  "em" 'counsel-org-goto
  )

(general-define-key
 :keymaps '(normal visual)
 "/" 'swiper
 )

(defhydra hydra-harpoon (:columns 1 :exit t)
  "Harpoon"
  ("a" ivy-push-view "Add" :color blue)
  ("d" ivy-pop-view "Remove" :color blue)
  ("m" ivy-switch-view "Menu" :color red)
  )

(general-define-key
 :keymaps '(normal visual)
 :override t
 "M-," 'hydra-harpoon/body
 )
