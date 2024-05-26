;; https://stackoverflow.com/questions/9663396/how-do-i-make-emacs-recognize-bash-environment-variables-for-compilation
;; (let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
;;   (setenv "PATH" path)
;;   (setq exec-path
;;         (append
;;          (split-string-and-unquote path ":")
;;          exec-path)))

;;  Check out this Emacs package:
;; https://github.com/purcell/exec-path-from-shell
