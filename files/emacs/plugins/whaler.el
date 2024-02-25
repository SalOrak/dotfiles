;; Custom plugin
(load-file "~/programming/whaler.el/whaler.el")

(setq whaler-directories-alist '("~/personal" "~/programming/" ))
(setq whaler-oneoff-directories-alist '( "~/org"))
(setq whaler-include-hidden-directories nil)

(whaler-populate-projects-directories)

;; Custom functions to extend whaler
(cl-defun salorak/whaler-prompt (&optional (post " >> "))
  "Whaler prompt"
  (concat "[" (f-filename whaler-current-working-directory) "]" post)
  )

(defun salorak/whaler-find-files ()
  "Custom find files function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (x)(interactive)
     (counsel-fzf
      ""
      x
      (salorak/whaler-prompt " -- Find files >> ")
      )
     )
   )
  )

(defun salorak/whaler-rg()
  "Execute `counsel-rg' function for `whaler.el' in the cwd."
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (x)(interactive)
     (counsel-rg
      ""
      x
      nil
      (salorak/whaler-prompt " -- Search String >> ")
      )
     )
   )
  )

(defun salorak/whaler-compile()
  "Execute `compile' function for `whaler.el' in the cwd."
  (interactive)

  (let (
	(compilation-command
	 (read-string (salorak/whaler-prompt " -- Compile commmand >> ")
		      )
	 ))
	(let (
	      (default-directory whaler-current-working-directory)
	      )
	  (compile compilation-command)
	  )
	)
    )

(defun salorak/whaler-dired-root ()
  "Open root project in dired for `whaler.el'"
  (interactive)
  (whaler-execute-function-on-current-working-directory
   (lambda (x)(interactive)
     (dired x)
     )
   )
  )

