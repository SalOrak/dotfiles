(defun sk/absolute-buffer-name-on-clipboard ()
  "Put the absolute path directory of the current buffer on clipboard and
insert it at point."
  (interactive)
  (require 'f)
  (let ((exp-buffer (f-dirname (expand-file-name (buffer-name)))))
    (kill-new exp-buffer)
    (message exp-buffer)))



(defun sk/buffer-name-on-clipboard ()
  "Put the current buffer name on clipboard and insert it at point."
  (interactive)
  (let ((bname (buffer-name)))
    (kill-new bname)
    (message bname)
    (insert bname)))
