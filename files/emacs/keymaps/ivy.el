;;  Ivy keybinds

(leader-spc 'normal 'override
  "bb" 'counsel-switch-buffer
  "bo" 'counsel-switch-buffer-other-window
  "fg" 'counsel-git-grep
  "tj" 'counsel-load-theme
  ",p" 'ivy-push-view ; Harpoon Add
  ",f" 'ivy-pop-view ; Harpoon delete
  ",m" 'ivy-switch-view; Harpoon Menu 
  )

(general-define-key
 :keymaps '(normal visual)
 "/" 'swiper
 )
