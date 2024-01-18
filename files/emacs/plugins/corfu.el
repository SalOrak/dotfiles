;; Corfu
;; Enhances in-buffer completion with a small completion popup.
;; It is the minimalistic in-buffer completion counterpart of the Vertico package.
(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-auto-prefix 2)
  :init
  (global-corfu-mode))
