;; Embark - Rigth menu click without the mause
(use-package embark
  :ensure t
  :bind
  (("C-." . embark-act)
   ("C-;" . emabark-dwim)
   ("C-h B" . embark-bindings))

  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :after embark
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
