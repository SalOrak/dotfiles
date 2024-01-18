;; Projectile keymaps

(leader-spc 'normal 'override
  "ff" 'projectile-find-file
  "fo" 'projectile-find-file-other-window
  "ss" 'projectile-ripgrep
  "ps" 'projectile-run-eshell ;; Run eshell root project
  "pd" 'projectile-dired ;; Run dired in the root of the project
  "ww" 'projectile-switch-project ;; New whaler
  "pc" 'projectile-compile-project ;; Compile root project
  )
