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


;; Custom 
(load-file "~/.config/emacs/custom/init.el")

;; Core 
(load-file "~/.config/emacs/core/init.el")

;; Plugins
(load-file "~/.config/emacs/plugins/init.el")

;; Keymaps 
(load-file "~/.config/emacs/keymaps/init.el")

;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(corfu counsel doom-themes evil-collection evil-nerd-commenter
	   evil-surround general go-mode haskell-mode helpful hl-todo
	   ivy kotlin-mode lua-mode magit marginalia markdown-mode
	   org-bullets php-mode projectile rg rust-mode tide undo-fu
	   vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
