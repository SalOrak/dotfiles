(package-initialize)

;; Setup package and use-package
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq use-package-always-ensure t)
(setq use-package-always-demand t)

;; Only start Emacs as server in Linux
(when (eq system-type 'gnu/linux)
  (server-start t t))

(setq vc-handled-backends nil) ;; Completely disable Emacs 'vc
(setq vc-follow-symlinks t) ;; Follow symlinks


;; Typed text replaces the selection if the selection is active
;; Gonna try not to because sometimes I miss it :)
(delete-selection-mode nil)

                                
;; Supress warnings (comp)
(setq warning-suppress-log-types '((comp)))

;; Garbage collector set to 100MB
(setq gc-cons-threshold 100000000)

;; Increase amount of data which Emacs read from the process
(setq read-process-output-max (* 1024 1024))

;; Home directory
(defconst sk/home-dir "~/.config/emacs/")

;; Change the custom-file location
(setq custom-file (concat sk/home-dir ".custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; Custom
(load-file (concat sk/home-dir "custom/init.el"))

;; Core
(load-file (concat sk/home-dir "core/init.el"))

;; Plugins
(load-file (concat sk/home-dir "plugins/init.el"))

;; Keymaps
;; (load-file (concat sk/home-dir "keymaps/init.el")) <-- Reworked --> Deprecated

;; Shadow 
(when (f-file-p (concat sk/home-dir "shadow/init.el"))
  (load-file (concat sk/home-dir "shadow/init.el"))
  )


(with-temp-buffer 
  (shell-command "dunstify --icon=emacs \"Emacs is ready\"" (current-buffer) (current-buffer)))

