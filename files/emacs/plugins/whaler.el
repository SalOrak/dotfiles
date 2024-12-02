;; Custom plugin
(use-package whaler
  :demand t
  :ensure t
  :general
  (leader-global 
    "sa" '(salorak/whaler-async-shell :wk "Async shell")
    "sA" '(salorak/whaler-async-shell-other :wk"oAsync shell")
    "ss" '(whaler :wk "Whaler")
    "sS" '(salorak/whaler-other :wk "oWhaler")
    "sd" '(salorak/whaler-dired-root :wk "Dired")
    "sD" '(salorak/whaler-dired-root-other :wk "oDired")
    "sb" '(salorak/whaler-compilation-buffer :wk "Buffer Compile")
    "sB" '(sk/compilation-switch-to-compilation-buffers :wk "Buffer[S] Compile")
    "sc" '(salorak/whaler-compile :wk "Compile")
    "sC" '(salorak/whaler-compile-other :wk "oCompile")
    "sp" '(whaler-populate-projects-directories :wk "Populate projects")
    "sf" '(salorak/whaler-consult-find-files  :wk "Find files")
    "sF" '(salorak/whaler-consult-find-files-other :wk "oFind files")
    "sr" '(salorak/whaler-consult-search-string :wk "Ripgrep")
    "sR" '(salorak/whaler-consult-search-string-other :wk "oRipgrep")
    "sg" '(salorak/whaler-consult-git-grep :wk "Git Grep")
    "sG" '(salorak/whaler-consult-git-grep-other :wk "oGit Grep")
    )

  :config
  (setq whaler-directories-alist '("~/personal" "~/programming/" "~/personal/burning-notes/labs/" "~/work"))
  (setq whaler-oneoff-directories-alist '( "~/org" "~/personal/dotfiles/files/emacs/"))
  (setq whaler-include-hidden-directories nil)
  (whaler-populate-projects-directories)
  )

;; Custom functions to extend whaler
(cl-defun salorak/whaler-prompt (&optional (post " >> ") (dir default-directory))
  "Whaler prompt"
  (concat "[" (f-filename dir) "]" post))

;; -------------------------------------------- 
;;  Common Functions
;; -------------------------------------------- 

(defun salorak/whaler-other ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler :change-cwd-auto nil))

(defun salorak/whaler-dired-root ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler-execute-function-on-current-working-directory 'dired ))

(defun salorak/whaler-compile()
  "Execute `compile' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)
     (interactive)
     (salorak/compile (salorak/whaler-prompt " - Compile: ")))))

(defun salorak/whaler-compilation-buffer ()
  "Go to the COMPILATION buffer associated with the current Whaler
selected project.

More information in `sk/compilation-project-goto-buffer'.
"
  (interactive)
  (sk/compilation-project-goto-buffer whaler-current-working-directory)
  )

(defun salorak/whaler-async-shell()
  "Custom async shell function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory 
   (lambda ()(interactive)
     (call-interactively #'async-shell-command)) nil))

(defun salorak/whaler-dired-root-other ()
  "Open root project in dired for `whaler.el' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action 'dired))

(defun salorak/whaler-compile-other ()
  "Wrapper for executing `compile' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action
          (lambda (dir)
            (interactive)
            (salorak/compile (salorak/whaler-prompt " - Compile: ")))))

(defun salorak/whaler-async-shell-other()
  "Custom async shell function for `whaler.el' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action
          (lambda ()
            (call-interactively #'async-shell-command))
          :action-arg nil))

;; -------------------------------------------- 
;;  Counsel Functions -- Ivy
;; -------------------------------------------- 

(defun salorak/whaler-counsel-find-files ()
  "Custom find files function for `whaler.el' in the cwd.
using `counsel-fzf'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-fzf "" dir
                  (salorak/whaler-prompt " -- Find files >> " dir)))))

(defun salorak/whaler-counsel-search-string ()
  "Wrapper for searching strings in another directory.
Execute `counsel-rg' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-rg "" dir nil
                 (salorak/whaler-prompt " -- Search String >> ")))))

(defun salorak/whaler-counsel-find-files-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-find-files))

(defun salorak/whaler-counsel-search-string-other ()
  "Wrapper for searching strings in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'salorak/whaler-counsel-search-string))


;; -------------------------------------------- 
;;  Consult Functions -- Vertico (/)
;; -------------------------------------------- 

(defun salorak/whaler-consult-find-files ()
  "Custom find files function for `whaler.el' in the cwd.
using `consult-fd'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (sk/consult-fd dir))))

(defun salorak/whaler-consult-git-grep ()
  "Custom find files function for `whaler.el' in the cwd.
using `consult-fd'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (consult-git-grep dir))))

(defun salorak/whaler-consult-search-string ()
  "Wrapper for searching strings in another directory.
Execute `consult-ripgrep' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (consult-ripgrep dir))))

(defun salorak/whaler-consult-find-files-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'sk/consult-fd :action-arg t))

(defun salorak/whaler-consult-git-grep-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'consult-git-grep :action-arg t))

(defun salorak/whaler-consult-search-string-other ()
  "Wrapper for searching strings in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'consult-ripgrep :action-arg t))
