;; init.el

;; Define custom plugin management functions
(defun sk/add-suffix (name)
  "Add Emacs Lisp suffix (.el) to 'name' argument whilst converting it to string."
  (concat (format "%s" name) ".el"))

(defun sk/expand-file (filename)
  "Finds and return the absolute path of the filename.
The argument 'filename' doesn't require the extension as it is automatically added."
  (expand-file-name (sk/add-suffix filename)))

(defun sk/set-directory (filename directory)
  "Adds a directory prefix to the filename"
  (setq filename (format "%s" filename))
  (setq directory (format "%s" directory))
  (concat sk/home-dir directory "/" (sk/add-suffix filename))
  )


(defun sk/load-plugins (plugins dir)
  "Loads files from a list of filenames in the 'dir' respecting the order.
The plugins doesn't require the extension nor to be strings.
Example:
(defvar plugins '(general evil marginalia)) "
  (mapcar (lambda (plug) (load-file (sk/set-directory plug dir))) plugins))

;; Load custom files

(defvar sk/custom-list 
  '(
    clipboard
    functions
    keycast
    modeline
    templates
    )
  )

(sk/load-plugins sk/custom-list 'custom)


