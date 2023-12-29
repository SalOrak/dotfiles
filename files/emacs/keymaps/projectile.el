;; Projectile keymaps

(leader-spc 'normal 'override
  "pf" 'projectile-find-file
  "pd" 'projectile-dired ;; Run dired in the root of the project
  "ww" 'projectile-switch-project ;; New whaler
  "pc" 'projectile-compile-project ;; Compile root project
  )
