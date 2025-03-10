(use-package auctex
  :ensure t
  :demand t
  :config
  (use-package auctex-latexmk
    :ensure t
    :demand t
    :config
    (auctex-latexmk-setup)
    )
  (use-package reftex
    :ensure t
    :demand t)

  (use-package latex-preview-pane
    :ensure t)

  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq LaTeX-item-indent tab-width) ; \item identation

  
  ;; Setup Zathura as the Viewer
  (TeX-source-correlate-mode)        ; activate forward/reverse search
  (TeX-PDF-mode)
  (add-to-list 'TeX-view-program-list '("zathura" zathura-forward-search))
  (setq TeX-view-program-selection (quote ((output-pdf "zathura") (output-dvi "xdvi"))))
  
  (setq zathura-procs ())
  (defun zathura-forward-search ()
    ;; Open the compiled pdf in Zathura with synctex. This is complicated since
    ;; 1) Zathura refuses to acknowledge Synctex directive if the pdf is not
    ;; already opened
    ;; 2) This means we have to bookkeep open Zathura processes ourselves: first
    ;; open a new pdf from the beginning, if it is not already open. Then call
    ;; Zathura again with the synctex directive.
    (interactive)
    (let* ((zathura-launch-buf (get-buffer-create "*Zathura Output*"))
           (pdfname (TeX-master-file "pdf"))
           (zatentry (assoc pdfname zathura-procs))
           (zatproc (if (and zatentry (process-live-p (cdr zatentry)))
                        (cdr zatentry)
                      (progn
                        (let ((proc (progn (message "Launching Zathura")
                                           (start-process "zathura-launch"
                                                          zathura-launch-buf "zathura"
                                                          "-x" "emacsclient +%{line} %{input}" pdfname))))
                          (when zatentry
                            (setq zathura-procs (delq zatentry zathura-procs)))
                          (add-to-list 'zathura-procs (cons pdfname proc))
                          (set-process-query-on-exit-flag proc nil)
                          proc))))
           (pid (process-id zatproc))
           (synctex (format "%s:0:%s"
                            (TeX-current-line)
                            (TeX-current-file-name-master-relative)))
           )
      (start-process "zathura-synctex" zathura-launch-buf "zathura" "--synctex-forward" synctex pdfname)
      (start-process "raise-zathura-wmctrl" zathura-launch-buf "wmctrl" "-a" pdfname) ;; Requires installing wmctrl
      ))
  )



