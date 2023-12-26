;; From tsoding config file
;; https://github.com/rexim/dotfiles/blob/master/.emacs.rc/rc.el

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

(defvar rc/package-contents-refreshed nil)

(defun rc/package-refresh-contents-once ()
  (when (not rc/package-contents-refreshed)
    (setq rc/package-contents-refreshed t)
    (package-refresh-contents)))

(defun rc/require-one-package (package)
  (when (not (package-installed-p package))
    (rc/package-refresh-contents-once)
    (package-install package)))

(defun rc/require (&rest packages)
  (dolist (package packages)
    (rc/require-one-package package)))


;; Try to debug it afterward. It just adds -theme to the theme name. Lazy mode 1 
;; (defun (rc/require-theme (theme) [...]
