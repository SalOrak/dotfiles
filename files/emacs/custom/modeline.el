;; Custom Modeline

(setq-default mode-line-format
              `("%e"
                my-modeline-whaler-current-project
                ))

(defvar-local my-modeline-buffer-name
    '(:eval (format "BUFFER: %s"
                    (propertize (buffer-name) 'face 'bold)))
  "Mode line construct to display the buffer name."
    )

(defvar-local my-modeline-major-mode
    '(:eval (format "MODE: %s"
                    (propertize (my-modeline--major-mode-name) 'face 'bold)))
  "Mode line construct to display the major mode."
    )

(defvar-local my-modeline-whaler-current-project
    '(:eval (format " %s "
                    (propertize (my-modeline--whaler-current-project-name) 'face 'bg-main)))
  "Mode line construct to display the current project selected."
    )

(defun my-modeline--whaler-current-project-name ()
  "Return whaler current project as a string"
  (whaler-execute-function-on-current-working-directory
   (lambda (_)
     (salorak/whaler-prompt "" default-directory))))


(defun my-modeline--major-mode-name ()
  "Return capitalzed `major-mode' as a string"
  (capitalize (symbol-name major-mode))
  )

(progn 
  (put 'my-modeline-buffer-name 'risky-local-variable t)
  (put 'my-modeline-major-mode 'risky-local-variable t)
  (put 'my-modeline-whaler-current-project 'risky-local-variable t)
)
