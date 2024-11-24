(cl-defun sk/mode-line--greater-or-eq-active-windows (&optional (maxwin 1))
  "Returns if there are stricly more than `maxwin' windows active.
By default `maxwin' is 1."
  (>= maxwin (cl-list-length (window-list))))

(defun sk/mode-line--buffer-status ()
  "Returns the buffer status. If it has been modified or not text."
  (if (buffer-modified-p)
      "+ "
    " "))

(defvar-local sk/mode-line-buffer-status
  '(:eval
    (propertize (sk/mode-line--buffer-status) 'face 'error))
  "Modeline buffer has been modified section")

(defun sk/mode-line--root-project ()
  "Returns the project root directory using `whaler'"
  (if (mode-line-window-selected-p)
   (format "[ %s ] " 
           (capitalize (car (last (f-split (whaler-current-working-directory))))))
   ""))

(defvar-local sk/mode-line-root-project
    '(:eval
      (propertize (sk/mode-line--root-project) 'face 'bold))
  "Modeline project root name")

(defun sk/mode-line--buffer-file-name ()
  "Return the buffer-filename string"
  (let ((retval
         (concat 
          (if (mode-line-window-selected-p)
              (if (buffer-file-name)
                  (file-name-nondirectory (buffer-file-name))
                (buffer-name))
            (if (buffer-file-name)
                (buffer-file-name)
              (buffer-name))) " ")))
    retval))

(defvar-local sk/mode-line-buffer-file-name
    '(:eval
      (propertize (sk/mode-line--buffer-file-name) 'face 'italic))
  "Modeline buffer filename string")

(defun sk/mode-line--major-mode ()
  "Returns the major-mode string"
  (if (mode-line-window-selected-p)
      (format "󰘧 %s " (capitalize (symbol-name major-mode)))
    ""
   ))

(defvar-local sk/mode-line-major-mode
    '(:eval
      (propertize (sk/mode-line--major-mode) 'face 'shadow)))

(defun sk/mode-line--magit-branch ()
  "Returns the magit current branch"
  (if (and (mode-line-window-selected-p) (sk/mode-line--greater-or-eq-active-windows))
      (if (magit-git-repo-p (whaler-current-working-directory))
          (let ((default-directory (whaler-current-working-directory)))
            (format " %s " (magit-get-current-branch)))
        "No branch ")
    ""))

(defvar-local sk/mode-line-magit-branch
    '(:eval
      (propertize (sk/mode-line--magit-branch) 'face 'error)))

(defun sk/mode-line--time ()
  "Returns the time string representing current day"
  (if (and (mode-line-window-selected-p) (sk/mode-line--greater-or-eq-active-windows))
      (format-time-string "%A %d at %H:%M ")
   ""))

(defun sk/mode-line--line-column-numbers ()
  "Returns the string representation of the current line
and column numbers"
  (if (mode-line-window-selected-p)
      (format "%dL󰁥 %dC " (line-number-at-pos) (current-column))
    ""))

(defvar-local sk/mode-line-position
    '(:eval
      (propertize (sk/mode-line--line-column-numbers))))

(defvar-local sk/mode-line-time
    '(:eval
      (propertize (sk/mode-line--time) 'face 'bold)))

(defun sk/mode-line--keycast ()
  "Returns the string representation of the last key pressed and command"
  (if (mode-line-window-selected-p)
      (concat sk/keycast--str " ")
    ""))

(defvar-local sk/mode-line-keycast
    '(:eval
      (propertize (sk/mode-line--keycast))))

                   
(progn
  (put 'sk/mode-line-buffer-status 'risky-local-variable t)
  (put 'sk/mode-line-root-project 'risky-local-variable t)
  (put 'sk/mode-line-buffer-file-name 'risky-local-variable t)
  (put 'sk/mode-line-major-mode 'risky-local-variable t)
  (put 'sk/mode-line-magit-branch 'risky-local-variable t)
  (put 'sk/mode-line-time 'risky-local-variable t)
  (put 'sk/mode-line-keycast 'risky-local-variable t)
  (put 'sk/mode-line-position 'risky-local-variable t)
  )

(setq-default mode-line-format
              '( "%e"
                 sk/mode-line-buffer-status
                 sk/mode-line-root-project
                 sk/mode-line-buffer-file-name
                 sk/mode-line-major-mode
                 "       "
                 sk/mode-line-keycast
                 sk/mode-line-position
                 "          "
                 sk/mode-line-magit-branch
                 sk/mode-line-time
                 )
              )

(sk/keycast-mode)
