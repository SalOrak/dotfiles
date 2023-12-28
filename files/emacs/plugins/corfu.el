;; Corfu
;; Enhances in-buffer completion with a small completion popup.
;; It is the minimalistic in-buffer completion counterpart of the Vertico package.
(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  :init
  (global-corfu-mode))
