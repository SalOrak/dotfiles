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

;; Compilation
(defun sk/compilation-goto-last-running-compilation-buffer ()
  "Goes to the last COMPILATION buffer.
If there the last COMPILATION buffer is in a Window select it.
Otherwise, open COMPILATION buffer in another window."
  (interactive)
  (let ((compilation-buffer (get-buffer-window next-error-last-buffer)))
  (cond
   ((not compilation-buffer)
    (switch-to-buffer-other-window next-error-last-buffer))
   (compilation-buffer
    (select-window (get-buffer-window next-error-last-buffer)))
   (t (message "No compilations buffers")))))

(cl-defun sk/compilation-project-goto-buffer (&optional (dir default-directory))
  "Goes to the COMPILATION buffer associated with the
current selected project defined by `dir'.

If the COMPILATION buffer is displayed, jump to it.

If the COMPILATION buffer is not displayed but alive, open
it on the other window.

If the COMPILATION buffer does not exist, display echo message.
"
  (interactive)
  (let*
      ((pj-file
        (cond
         ((eq (type-of dir) 'string)
          (f-filename dir))
         ((and (eq (type-of dir) 'symbol) (not (null dir)))
          (f-filename (funcall dir)))
         (t (f-filename default-directory))))
       (cbuffer (concat "*" pj-file "-compilation*")))
    (cond
     ;; When current project has compilation buffer alive
     ((buffer-live-p (get-buffer cbuffer)) 
      (cond
       ((get-buffer-window cbuffer)
        (select-window (get-buffer-window cbuffer)))
       (t (switch-to-buffer-other-window cbuffer))))
     ;; When the project has no compilation buffer alive
     (t (message (format "No compilation buffer for current project: '%s'" pj-file))))))


(defun sk/compilation--list-all-compilation-buffers()
  "Returns all buffers containing \"-compilation\" in their names"
 (let ((buffers '()))
    (dolist (buffer (buffer-list))
      (when (string-match (regexp-quote "-compilation") (buffer-name buffer))
        (push (buffer-name buffer) buffers)
        ))
    buffers))

(defun sk/compilation-switch-to-compilation-buffers ()
  "Switch to a PROJECT based compilation buffer.

It searches for any buffers ending with \"-compilation\".

If the compilation buffer is displayed, select it.
Otherwise, switch to the compilation buffer in another window.
"
  (interactive)
  (let* ((all-buffers (sk/compilation--list-all-compilation-buffers)))
    (let ((choice (completing-read "Compilation buffers: " all-buffers nil t)))
      (cond
       ((get-buffer-window choice)
        (select-window (get-buffer-window choice)))
        (t 
         (switch-to-buffer-other-window (get-buffer choice)))))))


(defun sk/compilation-delete-windows ()
  "Deletes all visible compilation buffers windows"
  (interactive)
  (let ((cbuffers (match-buffers "compilation*")))
    (dolist (b cbuffers)
      (when (get-buffer-window b)
        (delete-window (get-buffer-window b)))
     )))
         



