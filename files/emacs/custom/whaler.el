(require 'f)
(require 'ivy)

(defvar whaler/dirs
  '(
    "~/programming/"
    "~/org/"
    )
  )

(defvar whaler/custom-dirs '())
(defvar whaler/current-working-dir nil) 
(defvar whaler/default-working-dir (f-full "~"))

(defun whaler/find-files-in-current-working-dir ()
  "Find files in the current working directory. If whaler has not been loaded it will use the home directory as fallback"
  (interactive)
  
  (if (f-dir-p whaler/current-working-dir) 
      (counsel-find-file "" whaler/current-working-dir)
    (counsel-find-file "" whaler/default-working-dir)
    )
   )

(defun whaler/generate-subdirectories (list)
  "Prints all subdirectories inside a directory" 
  (interactive)
  (setq whaler/custom-dirs '())
  (let (value)
    (dolist (value list)
      (let (el)
	(dolist (el (f-directories (f-long value) (lambda (x) (not (f-hidden-p x 'last)) ) ))
	  (add-to-list 'whaler/whaler-dirs el)
	  )
	)
      )
    )
  )

(defun whaler/whaler ()
  "Testing ivy actions"
  (interactive)
  (ivy-read "Whaler: " whaler/custom-dirs
	    :require-match t ;; Only one candidate
	    :action (lambda (x)
		      (progn
			(if (not whaler/whaler-dirs)
			    (whaler/generate-subdirectories)
			    )
			(setq whaler/current-working-dir (f-slash x))
			(dired whaler/current-working-dir)
			)
		      )
	    
	    )
  )


(if (not whaler/current-working-dir) (print "Yay") (print "Nope") )

(leader-spc 'normal 'override
  "$$" 'whaler/whaler
  "--" 'whaler/find-files-in-current-working-dir
  )


