;; early-init.el -- Early Init -*- no-byte-compile: t; lexical-binding: t; -*-

;;  Optimize startup time


;; Set-language-environment sets default-input-method, which is not required.
;; default-input-method is designed for multitllingual text.
;; Can be toggled by `toggle-input-method'.
(setq default-input-method nil)


;; Performance-wise

;; Prefer loading newer compiled files always
(setq load-prefer-newer t)

;; Reduce rendering/line scan work by not rendering cursos or regions
;; in non-focused windows
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Disable warnings from the legacy advice API.
(setq ad-redefinition-action 'accept)


;; By default, Emacs 'updated its ui more often than it needs to
(setq idle-update-delay 1.0) ;; Default is 0.5

;; Disable bidirectional text scanning for a modest performance boost.
(setq-default bidi-display-reordering 'left-to-right)
(setq-default bidi-paragraph-direction 'left-to-right)

;; Disable biderectional parenthesis algorithm for faster redisplay.
(setq bidi-inhibit-bpa t)

;; Remove message at startup
(advice-add #'display-startup-echo-area-message :override #'ignore)

;; Supress the vanilla startup screen completely.
(advice-add #'display-startup-screen :override #'ignore)


;; Disable startup screens and messages
(setq inhibit-splash-screen t)

;; Disable GUIs as they are inconsistent
(setq use-file-dialog nil)
(setq use-dialog-box nil)


