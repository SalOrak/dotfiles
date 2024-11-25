;; -*- lexical-binding: t -*-
;; Create projects based on templates directories
;; It is used for templating LaTeX projects but
;; it can be used for any kind of project.

(defvar sk/templates-default-dir "/path/to/templates/directory")
(defvar sk/templates-classes-list '("REPLACE" "REPLACE-2"))

(defun sk/template-project (&optional dir)
  "Create a LaTeX template:
Steps to create a LaTeX template:
1. Select the template project
2. Choose the class
3. Chose the name of the project
"
  (interactive)
  (let* ((dir (f-slash (or dir default-directory)))
        (templates (sk/--generate-templates-hash))
        (keys (sk/--hash-get-key-as-list templates))
        (chosen-template (completing-read "Select template >>" keys nil t))
        (chosen-class (completing-read "Choose class >>" sk/templates-classes-list nil t))
        (chosen-name (read-string (format "Name the %s: " chosen-template)))
        (template-dir (format "%s%s-%s" dir chosen-template (format-time-string "%H%m%S")))
        (main-dir (format "%s%s" dir chosen-name))
        (main-file (format "%s/%s/main.tex" dir chosen-name)))
    (message (format "Creating LaTeX template at %s" dir))
    (cond
     ((f-dir-p main-dir)
      (warn (format "[ERROR] %s with name %s already exists " chosen-template chosen-name)))
     (t
      (f-copy (gethash chosen-template templates) template-dir)
      (f-move template-dir main-dir)
      (sk/--replace-string-in-file main-file "MCLASS" chosen-class)
      )
     )
    )
  )

(defun sk/--generate-templates-hash ()
  "Return the hash of templates available in `sk/templates-default-dir'
Hash table format is:
KEY the name of the template.
VALUE the path to the template directory.
"
  (let ((dirs (f-directories sk/templates-default-dir))
        (hash-templates (make-hash-table :test 'equal)))
    (dolist (dir dirs)
      (puthash
       (format "%s" (car (last (f-split  dir))))
       dir
       hash-templates)
      )
    hash-templates
    )
  )

(defun sk/--hash-get-key-as-list (hash)
  "Return the list of KEYS from the HASH"
  (let ((keys '()))
    (maphash (lambda (k v) (add-to-list 'keys k)) hash)
    keys))

(defun sk/--replace-string-in-file (file from to)
  "Replace all occurrences of FROM with TO in FILE.
It is NOT recursive"
  (with-temp-buffer
    (insert-file-contents file) ;; Load the file contents into the buffer
    (goto-char (point-min))     ;; Start at the beginning
    (while (search-forward from nil t)
      (replace-match to t t))
    (write-region (point-min) (point-max) file)))

