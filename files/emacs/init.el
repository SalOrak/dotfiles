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

;; Home directory
(defconst salorak/home-dir "~/.config/emacs/")

;; Change the custom-file location
(setq custom-file (concat salorak/home-dir ".custom.el"))
(when (f-file-p custom-file)
  (load custom-file))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-mode restclient ivy-avy shell-pop dumb-jump zoom-window ace-window find-file-in-project elpy typescript-mode yaml-mode markdown-mode kotlin-mode lua-mode haskell-mode rust-mode go-mode tide php-mode org-bullets org-roam doom-modeline ztree rg counsel ivy cape corfu marginalia helpful hl-todo magit evil-nerd-commenter evil-surround evil-collection evil undo-fu hydra general amx nerd-icons f doom-themes gruvbox-theme exec-path-from-shell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
