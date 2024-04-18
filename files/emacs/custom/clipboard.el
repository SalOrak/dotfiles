(defun salorak/absolute-buffer-name-on-clipboard ()
  "Put the absolute path directory of the current buffer on clipboard and
insert it at point."
  (interactive)
  (let ((exp-buffer (expand-file-name (buffer-name))))
    (kill-new exp-buffer)
    (message exp-buffer)
    (insert exp-buffer)))

(defun salorak/buffer-name-on-clipboard ()
  "Put the current buffer name on clipboard and insert it at point."
  (interactive)
  (let ((bname (buffer-name)))
    (kill-new bname)
    (message bname)
    (insert bname)))
