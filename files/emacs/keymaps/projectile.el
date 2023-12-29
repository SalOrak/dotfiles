;; Projectile keymaps

(leader-spc 'normal 'override
  "ff" 'projectile-find-file
  "ss" 'projectile-ripgrep
  "fs" 'projectile-root-local
  "ps" 'projectile-run-eshell ;; Run eshell root project
  "pf" 'projectile-find-file
  "pd" 'projectile-dired ;; Run dired in the root of the project
  "ww" 'projectile-switch-project ;; New whaler
  "pc" 'projectile-compile-project ;; Compile root project
  )
