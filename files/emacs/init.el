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
 '(custom-safe-themes
   '("69f7e8101867cfac410e88140f8c51b4433b93680901bb0b52014144366a08c8" "3d94d6d1a1c23113a60c8496c9aed094dbc2695f219e8127bb168d17b1e6dab3" "21e3d55141186651571241c2ba3c665979d1e886f53b2e52411e9e96659132d4" default))
 '(package-selected-packages
   '(modus-themes shell-pop dumb-jump zoom-window zoom-windows undo-tree ace-window find-file-in-project markdown-mode kotlin-mode lua-mode haskell-mode rust-mode go-mode tide php-mode org-bullets org-roam doom-modeline projectile rg counsel ivy cape corfu marginalia helpful hl-todo magit evil-org evil-nerd-commenter evil-surround evil-collection evil undo-fu general doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
