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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(undo-tree ace-window find-file-in-project markdown-mode kotlin-mode lua-mode haskell-mode rust-mode go-mode tide php-mode org-bullets org-roam doom-modeline projectile rg counsel ivy cape corfu marginalia helpful hl-todo magit evil-org evil-nerd-commenter evil-surround evil-collection evil undo-fu general doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
