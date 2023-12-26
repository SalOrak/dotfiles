(package-initialize)

(load "~/.emacs.rc/rc.el")

 ;; (global-set-key (kbd "C-c p") 'find-file-at-point) ;; Go to file under cursor
;; (global-set-key (kbd "C-c i m") 'imenu) ;; move around files (REALLY NICE!)

;; For OS X only. Sets Command key to Meta key.
(when (eq system-type 'darwin)
 (setq mac-command-key-is-meta t)
 (setq mac-option-key-is-meta nil)
 (setq mac-command-modifier 'meta)
 (setq mac-option-modifier nil)
)

;; Set /bin/bash as default shell
(setq-default explicit-shell-file-name "/bin/bash")
(setq-default shell-file-name "/bin/bash")
(setenv "BASH_ENV" "$HOME/.bashrc")

;; Confirm killing emacs
(setq confirm-kill-emacs 'y-or-n-p)

;; Toggle Full Screen at startup
;; (add-to-list 'default-frame-alist '(fullscreen . fullscreen))

;; Disable startup screen
(setq inhibit-startup-screen t)

;; Disable backup files
(setq make-backup-files nil)
(setq-default tab-width 4)

(setq-default indent-tabs-mode nil)
(setq-default compilation-scroll-output t)

;; Change built-in visual modes
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode 1)

(global-display-line-numbers-mode t)
(setq-default display-line-numbers-type (quote relative))
(setq-default display-line-numbers-width 3)
(setq-default display-line-numbers-start t)

;; Set fonts
(add-to-list 'default-frame-alist '(font . "Meslo LGM Nerd Font"))

;; Remove scroll bar
(scroll-bar-mode 0)
(show-paren-mode 1)

;; Always follow symbolic link 
;; https://stackoverflow.com/questions/15390178/emacs-and-symbolic-links
(setq vc-handled-backends nil) ;; Completely disable Emacs 'vc
(setq vc-follow-symlinks t)

;; Theme
;;(rc/require 'zenburn-theme) ;; Chill theme
(rc/require 'kanagawa-theme)
(load-theme 'kanagawa t)

;; Alpha background
;;(set-frame-parameter nil 'alpha-background 70)
(add-to-list 'default-frame-alist '(alpha-background . 99)) 

;; Relative number font to pitched-fonts
(set-face-attribute 'line-number nil :family "Meslo LGM Nerd Font")
(set-face-attribute 'line-number-current-line nil :family "Meslo LGM Nerd Font")

;; Highlight TODO
(rc/require 'hl-todo)
(global-hl-todo-mode) 
;; TODO: add keymaps to move around TODO 
;; (keymap-set hl-todo-mode-map "C-c p" #'hl-todo-previous) 


;; For evil-collections to work correctly
(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-undo-system 'undo-fu) ;; Undo C-r for Vi

;; evil mode
(rc/require 'evil)
(evil-mode 1)

;; collection of evil on different modes
(rc/require 'evil-collection)
(evil-collection-init)


;; evil-surround  
(rc/require 'evil-surround)
(global-evil-surround-mode 1)

;; evil rebindings
(evil-set-leader 'normal (kbd "<SPC>")) ;; <space> as leader key
(evil-define-key 'normal 'global (kbd "<leader> f d") 'dired) ;; deadgrep find files
(evil-define-key 'normal 'global (kbd "<leader> f f") 'find-file) ;; deadgrep find files
(evil-define-key 'normal 'global (kbd "<leader> m s") 'magit-status) ; 
(evil-define-key 'normal 'global (kbd "<leader> m l") 'magit-log) ;;
(evil-define-key 'normal 'global (kbd "go") 'evil-jump-backward) ;; Go back from go to definition (previously C-o)
(evil-define-key 'normal 'global (kbd "gd") 'evil-goto-definition) ;; Rewired go to definition
(evil-define-key 'normal 'global (kbd "<leader> b s") 'ido-switch-buffer ) ;; switch to buffer
(evil-define-key 'normal 'global (kbd "<leader> b l") 'list-buffers ) ;; files guessing around text TODO: automatically switch to buff
(evil-define-key 'normal 'global (kbd "<leader> w c") 'other-window ) ;; change to another window (evil-define-key 'normal 'global (buff 
(evil-define-key 'normal 'global (kbd "<leader> w h") 'split-window-right ) ;; split horizontal
(evil-define-key 'normal 'global (kbd "<leader> w v") 'split-window-vertically ) ;; split vertical 
(evil-define-key 'normal 'global (kbd "<leader> w o") 'delete-other-windows ) ;; kill window
(evil-define-key 'normal 'global (kbd "<leader> w k") 'delete-window ) ;; kill window
(evil-define-key 'normal 'global (kbd "<leader> w d") 'kill-buffer-and-window ) ;; delete window

;; evil in dired
(eval-after-load 'dired
  '(evil-set-leader 'normal (kbd "<SPC>"))
  )

(eval-after-load 'dired
  '(evil-define-key 'normal dired-mode-map
     (kbd "fd") 'dired ;; dired
     (kbd "ff") 'find-file ;; find files
     (kbd "fp") 'find-file-at-point ;; find files guessing around text
     (kbd "bs") 'ido-switch-buffer ;; switch to buffer
     (kbd "bl") 'list-buffers ;; files guessing around text TODO: automatically switch to buff
     (kbd "wc") 'other-window ;; change to another window (buff 
     (kbd "wh") 'split-window-right ;; split horizontal
     (kbd "wv") 'split-window-vertically ;; split vertical 
     (kbd "wo") 'delete-other-windows ;; kill window
     (kbd "wk") 'delete-window ;; kill window
     (kbd "wd") 'kill-buffer-and-window ;; delete window
     )
  )

;; ido (Completion packages) 
(rc/require 'smex 'ido-completing-read+)
(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; dired
(require 'dired-x)
(setq  dired-omit-files
       (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t) ; guess dir
(setq dired-listing-switches "-alh")

;; maGit
(rc/require 'magit)
(setq-default magit-auto-revert-mode nil)

;; Company (Completion)
(rc/require 'company)
(require 'company)
(global-company-mode)

;; Helpful (documentation -- replacement)
(rc/require 'helpful)
(global-set-key (kbd "C-h f") #'helpful-callable) 
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-h x") #'helpful-command)

;; deadgrep (uses ripgrep) Fuzzy finder
;; (rc/require 'deadgrep)

;; Undo-tree
(rc/require 'undo-fu)

;; Evil-nerd-commenter. Easy comment (M-;)
(rc/require 'evil-nerd-commenter)

;;; Global keybinding for commenting
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)

;;; Create comment text object
;; (setq evilnc-comment-text-object "c")
;; (define-key evil-inner-text-objects-map evilnc-comment-text-object 'evilnc-inner-commenter)
;; (define-key evil-outer-text-objects-map evilnc-comment-text-object 'evilnc-outer-commenter)

;;; Operator for evil text objects
;; (define-key evil-normal-state-map ",," 'evilnc-comment-operator)
(define-key evil-visual-state-map ",," 'evilnc-comment-operator)
(define-key evil-normal-state-map ",cs" 'evilnc-comment-box) ;; Creates a commentary box (Normal)
(define-key evil-visual-state-map ",cs" 'evilnc-comment-box) ;; Creates a commentary box (Visual) 1,cs --> 1 line commentary box

;;; Language Modes
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

;;;; No configuration required
(rc/require
 'csv-mode
 'toml-mode
 'yaml-mode
 'markdown-mode
 'dockerfile-mode
 'terraform-mode
 'nginx-mode
 'lua-mode
 'rust-mode
 'go-mode
 'elpy
 'cmake-mode
 'rfc-mode)

(require 'compile)
 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(afternoon-theme cmake-mode csv-mode dockerfile-mode doom-themes elpy
                     evil-collection evil-nerd-commenter evil-surround
                     go-mode helpful hl-todo ido-completing-read+
                     kanagawa-theme lua-mode magit markdown-mode
                     nginx-mode rfc-mode rust-mode smex terraform-mode
                     toml-mode undo-fu yaml-mode))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
