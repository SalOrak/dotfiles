;; Custom plugin
(use-package whaler
  :config
  (setq whaler-directories-alist '("~/personal" "~/programming/" "~/personal/burning-notes/labs/" "~/work"))
  (setq whaler-oneoff-directories-alist '( "~/org" "~/personal/dotfiles/files/emacs/"))
  (setq whaler-include-hidden-directories nil)
  (whaler-populate-projects-directories)
)


;; Custom functions to extend whaler
(cl-defun salorak/whaler-prompt (&optional (post " >> ") (dir default-directory))
  "Whaler prompt"
  (concat "[" (f-filename dir) "]" post)
  )


(defun salorak/whaler-async-shell()
  "Custom async shell function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory 
   (lambda ()(interactive)
     (call-interactively #'async-shell-command)) nil))


(defun salorak/whaler-find-files ()
  "Custom find files function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-fzf
      ""
      dir
      (salorak/whaler-prompt " -- Find files >> " dir)
      )
     )
   )
  )

(defun salorak/whaler-rg()
  "Execute `counsel-rg' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)(interactive)
     (counsel-rg
      ""
      dir 
      nil
      (salorak/whaler-prompt " -- Search String >> ")
      )
     ) t))

(defun salorak/whaler-compile()
  "Execute `compile' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (dir)
     (interactive)
     (let (
	   (compilation-command
	    (read-string (salorak/whaler-prompt " -- Compile commmand >> " dir)
			 )
	    ))
       (compile compilation-command)
       ))))

(defun salorak/whaler-dired-root ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler-execute-function-on-current-working-directory 'dired ))

(defun salorak/whaler-counsel-find-files (dir)
  "Wrapper for finding files in another directory"
  (interactive)
  (counsel-fzf
   ""
   dir
   (salorak/whaler-prompt " -- Find files >> " dir)
   )
  )

(defun salorak/whaler-counsel-search-strings (dir)
  "Wrapper for searching strings in another directory"
  (interactive)
  (counsel-rg
   ""
   dir
   nil
   (salorak/whaler-prompt " -- Search String >> " dir)
   )
  )

(defun salorak/whaler-compile-other ()
  "Wrapper for executing `compile' in another directory."
  (interactive)
  (let (
	(compilation-command
	 (read-string (salorak/whaler-prompt " -- Compile commmand >> ")
		      )
	 ))
    (compile compilation-command)
    )
  )

