(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))


(setq vc-handled-backends nil) ;; Completely disable Emacs 'vc
(setq vc-follow-symlinks t) ;; Follow symlinks 

;; Supress warnings (comp)
(setq warning-suppress-log-types '((comp)))

;; Core 
(load "~/.config/emacs/core/init.el")

;; Plugins
(load "~/.config/emacs/plugins/init.el")
