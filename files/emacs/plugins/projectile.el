;; Projectile.
;; My thoughts: Projectile is a well stablished and easy to use project manager. It supports anything out of the box and more.
;; One of the things I'm missing is the ability to perform any action on another project without losing my current project.
;; > In fact, this is such a crucial functionality that Whaler works around this idea. It does not only provide a context on which
;; > to perform actions, i.e. a root directory, it also gives the ability to perform any operation on any project.
;; It might be a good idea to automagically search for directories in order to update the directories, even though I think it is not worth it.
;; > Once you notice the project is not in the path, you can just call 'whaler-populate-project-directories.
;;  But, one of the things I would like to do is create a(nother) package that includes all the functionality that Projectile comes with.
;; 
;; Another feature though, is the ability to search and replace. There should be a proper way to do a search and replace project / directory wide
;; without having to manually operate grep + wgrep buffers. How can I implement this, the easy way? Can I do it with regex patterns so it can include
;; captures groups on it?
;;
;; Also, I should add a migration guide to from Projectile / Project.el to Whaler. (the name is not intuitive but comes from the neovim port).x
(use-package projectile
  :ensure t
  :general
  (leader-global
    "ja" '(projectile-find-file :wk "Find files")
    "je" '(projectile-ibuffer :wk "Ibuffer")
    "jr" '(projectile-ripgrep :wk "Ripgrep")
    "jj" '(projectile-switch-project :wk "Switch project")
    "jc" '(projectile-compile-project :wk "Compile project")
        )
  :init
  (setq projectile-project-search-path '("~/work" "~/personal/" "~/programming/"))
  :config
  (projectile-mode +1))

     
