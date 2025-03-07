;; Custom plugin
(use-package whaler
  :demand t
  :ensure t
  :general
  (leader-global :keymaps '(override)
    "p" '(whaler :wk "Whaler")
    ;; "f" '(sk/whaler-consult-find-files  :wk "Find files")
    "f" '(sk/whaler-consult-find-files  :wk "Find files")
    "h" '(sk/whaler-async-shell :wk "Async shell")
    "." '(async-shell-command :wk "Here Async Shell")
    "r" '(sk/whaler-consult-search-string :wk "Ripgrep")
    "q" '(sk/whaler-compile :wk "Compile")
    "u" '(sk/whaler-compilation-buffer :wk "Buffer Compile")
    "U" '(sk/compilation-switch-to-compilation-buffers :wk "Compile Switch")
    "d" '(sk/whaler-dired-root :wk "Dired")
    "C-d" '(sk/whaler-project-doc :wk "Docs")
    ;; "j" '(sk/whaler-consult-git-grep :wk "Git Grep") ; I use ripgrep instead
    "F" '(sk/whaler-consult-find-files-other  :wk "Find files")
    "H" '(sk/whaler-async-shell-other :wk "Async shell")
    "R" '(sk/whaler-consult-search-string-other :wk "Ripgrep")
    "Q" '(sk/whaler-compile-other :wk "Compile")
    "D" '(sk/whaler-dired-root-other :wk "Dired")
    ;; "J" '(sk/whaler-consult-git-grep-other :wk "Git Grep") ; I use ripgrep instead
    "C-p" '(sk/whaler-cwd-to-whaler :wk "Current directory as Whaler")
    )
  :config
  (setq whaler-directories-alist '("~/personal" "~/programming/" "~/work"))
  (setq whaler-oneoff-directories-alist '("~/personal/dotfiles/files/emacs/"))
  (setq whaler-include-hidden-directories nil)
  (whaler-populate-projects-directories)
  )

;; Custom functions to extend whaler
(cl-defun sk/whaler-prompt (&optional (post " >> ") (dir default-directory))
  "Whaler prompt"
  (concat "[" (f-filename dir) "]" post))

(defun sk/whaler-cwd-to-whaler ()
  "Set the current directory to the current whaler working directory"
  (interactive)
  (setq whaler-current-working-directory default-directory)
  )

;; -------------------------------------------- 
;;  Common Functions
;; -------------------------------------------- 

(defun sk/whaler-other ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler :change-cwd-auto nil))

(defun sk/whaler-dired-root ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler-execute-function-on-current-working-directory 'dired ))

(defun sk/whaler-compile()
  "Execute `compile' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)
     (interactive)
     (sk/compile (sk/whaler-prompt " - Compile: ")))))

(defun sk/whaler-compilation-buffer ()
  "Go to the COMPILATION buffer associated with the current Whaler
selected project.

More information in `sk/compilation-project-goto-buffer'.
"
  (interactive)
  (sk/compilation-project-goto-buffer whaler-current-working-directory)
  )

(defun sk/whaler-async-shell()
  "Custom async shell function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory 
   (lambda ()(interactive)
     (call-interactively #'async-shell-command)) nil))

(defun sk/whaler-dired-root-other ()
  "Open root project in dired for `whaler.el' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action 'dired))

(defun sk/whaler-compile-other ()
  "Wrapper for executing `compile' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action
          (lambda (dir)
            (interactive)
            (sk/compile (sk/whaler-prompt " - Compile: ")))))

(defun sk/whaler-async-shell-other()
  "Custom async shell function for `whaler.el' in another directory."
  (interactive)
  (whaler :change-cwd-auto nil :action
          (lambda ()
            (call-interactively #'async-shell-command))
          :action-arg nil))

;; -------------------------------------------- 
;;  Counsel Functions -- Ivy
;; -------------------------------------------- 

(defun sk/whaler-counsel-find-files ()
  "Custom find files function for `whaler.el' in the cwd.
using `counsel-fzf'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-fzf "" dir
                  (sk/whaler-prompt " -- Find files >> " dir)))))

(defun sk/whaler-counsel-search-string ()
  "Wrapper for searching strings in another directory.
Execute `counsel-rg' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-rg "" dir nil
                 (sk/whaler-prompt " -- Search String >> ")))))

(defun sk/whaler-counsel-find-files-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'sk/whaler-counsel-find-files))

(defun sk/whaler-counsel-search-string-other ()
  "Wrapper for searching strings in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'sk/whaler-counsel-search-string))


;; -------------------------------------------- 
;;  Consult Functions -- Vertico (/)
;; -------------------------------------------- 

(defun sk/whaler-consult-find-files ()
  "Custom find files function for `whaler.el' in the cwd.
using `consult-fd'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (sk/consult-fd dir))))

(defun sk/whaler-fzf-find-files ()
  "Custom find files function for `whaler.el' in the cwd.
using `fzf'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (fzf-git))))

(defun sk/whaler-consult-git-grep ()
  "Custom find files function for `whaler.el' in the cwd.
using `consult-fd'."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (consult-git-grep dir))))

(defun sk/whaler-consult-search-string ()
  "Wrapper for searching strings in another directory.
Execute `consult-ripgrep' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (consult-ripgrep dir))))

(defun sk/whaler-project-doc ()
  "Goes to the project document, i.e. the README.org file from the project"
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)
     (interactive)
     (find-file (f-join dir "README.org"))
     )
   )
  )

(defun sk/whaler-consult-find-files-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'sk/consult-fd :action-arg t))

(defun sk/whaler-fzf-find-files-other ()
  "Wrapper for finding files using `fzf' in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'fzf :action-arg nil))

(defun sk/whaler-consult-git-grep-other ()
  "Wrapper for finding files in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'consult-git-grep :action-arg t))

(defun sk/whaler-consult-search-string-other ()
  "Wrapper for searching strings in another directory"
  (interactive)
  (whaler :change-cwd-auto nil :action 'consult-ripgrep :action-arg t))
