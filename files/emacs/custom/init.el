;; init.el

;; Define custom plugin management functions
(defun salorak/add-suffix (name)
  "Add Emacs Lisp suffix (.el) to 'name' argument whilst converting it to string."
  (concat (format "%s" name) ".el"))

(defun salorak/expand-file (filename)
  "Finds and return the absolute path of the filename.
The argument 'filename' doesn't require the extension as it is automatically added."
  (expand-file-name (salorak/add-suffix filename)))

(defun salorak/set-directory (filename directory)
  "Adds a directory prefix to the filename"
  (setq filename (format "%s" filename))
  (setq directory (format "%s" directory))
  (concat salorak/home-dir directory "/" (salorak/add-suffix filename))
  )


(defun salorak/load-plugins (plugins dir)
  "Loads files from a list of filenames in the 'dir' respecting the order.
The plugins doesn't require the extension nor to be strings.
Example:
(defvar plugins '(general evil marginalia)) "
  (mapcar (lambda (plug) (load-file (salorak/set-directory plug dir))) plugins))

;; Load custom files

(defvar salorak/custom-list 
  '(
    clipboard
    functions
    keycast
    modeline
    )
  )

(salorak/load-plugins salorak/custom-list 'custom)


