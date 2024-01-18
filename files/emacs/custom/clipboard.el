(defun salorak/absolute-buffer-name-on-clipboard ()
  "Put the absolute path directory of the current buffer on clipboard"
  (interactive)
  (kill-new (expand-file-name (buffer-name)))
  (message (expand-file-name (buffer-name)))
    )

(defun salorak/buffer-name-on-clipboard ()
  "Put the current buffer name on clipboard"
  (interactive)
  (kill-new (buffer-name))
  (message (buffer-name))
  )
