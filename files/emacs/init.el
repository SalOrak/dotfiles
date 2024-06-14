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

;; Only start Emacs as server in Linux
(when (eq system-type 'gnu/linux)
  (server-start))

(setq vc-handled-backends nil) ;; Completely disable Emacs 'vc
(setq vc-follow-symlinks t) ;; Follow symlinks

;; Supress warnings (comp)
(setq warning-suppress-log-types '((comp)))

;; Garbage collector set to 100MB
(setq gc-cons-threshold 100000000)

;; Increase amount of data which Emacs read from the process
(setq read-process-output-max (* 1024 1024))

;; Path example
;; (setenv "PATH" (concat (getenv "PATH") ":" (expand-file-name "/opt/software/openjdk-22/bin")))
;; (setq exec-path (append exec-path (list (expand-file-name "/opt/software/openjdk-22/bin"))))


;; Home directory
(defconst salorak/home-dir "~/.config/emacs/")

;; Custom
(load-file (concat salorak/home-dir "custom/init.el"))

;; Core
(load-file (concat salorak/home-dir "core/init.el"))

;; Plugins
(load-file (concat salorak/home-dir "plugins/init.el"))

;; Keymaps
(load-file (concat salorak/home-dir "keymaps/init.el"))

;; Shadow 
(when (f-file-p (concat salorak/home-dir "shadow/init.el"))
  (load-file (concat salorak/home-dir "shadow/init.el"))
)
