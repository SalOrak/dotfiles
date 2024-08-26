;; Faces
(defun sk/list-face-attributes (face)
  "List all attributes for a given FACE."
  (mapcar #'car (face-all-attributes face)))

(defun sk/copy-face-attrs (from-face to-face)
  "Copy all attributes of `from-face' face to `to-face' face."
  (mapc (lambda (attr)
          (set-face-attribute to-face nil
                              attr (face-attribute from-face attr)))
        (sk/list-face-attributes from-face))
  )

