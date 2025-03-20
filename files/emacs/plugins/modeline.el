(use-package mood-line
  :init
  (defun sk/--mood-whaler-cwd ()
    (format "[ %s ] " 
            (capitalize (car (last (f-split (whaler-current-working-directory)))))))
  
  :custom
  ;; (mood-line-format mood-line-format-default)
  (mood-line-glyph-alist mood-line-glyphs-unicode)
  (mood-line-format (mood-line-defformat
                     :left
                     (" " (mood-line-segment-modal) " "
                      (or (mood-line-segment-buffer-status) " ") " "
                      (sk/--mood-whaler-cwd) 
                      (mood-line-segment-buffer-name) "  " (mood-line-segment-anzu) "  "
                      (mood-line-segment-multiple-cursors) "  "
                      (mood-line-segment-cursor-position) " " (mood-line-segment-scroll)
                      "")
                     :right
                     ((mood-line-segment-vc) "  " (mood-line-segment-major-mode) "  "
                      (mood-line-segment-misc-info) "  " (mood-line-segment-checker) "  "
                      (mood-line-segment-process) "  " " "))
                     )
  
  :config
  (mood-line-mode 1)
  )
