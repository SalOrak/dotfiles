;; Corfu
;; Enhances in-buffer completion with a small completion popup.
;; It is the minimalistic in-buffer completion counterpart of the Vertico package.
(use-package corfu
  :demand t
  :general
  (:keymaps 'corfu-map
            "C-n" 'corfu-next
            "C-p" 'corfu-previous
            "C-a" 'corfu-prompt-beginning
            "C-e" 'corfu-prompt-end
            "C-d" 'corfu-popupinfo-toggle
            "C-b" 'corfu-info-documentation
            "C-y" 'corfu-complete
            "C-k" 'corfu-quit
            "TAB" nil
            "RET" nil
            )
  :config
  (setq corfu-cycle t)
  (setq corfu-auto t)
  (setq corfu-auto-prefix 2)
  (setq corfu-preselect 'valid)
  (setq text-mode-ispell-word-completion nil)
  (customize-set-variable 'text-mode-ispell-word-completion nil)
  :init
  (global-corfu-mode)
  (corfu-echo-mode)  ;; Displays a brief candidate documentation in the echo area.
  )



