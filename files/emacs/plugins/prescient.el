;; Prescient
;; prescient.el: simple but effective sorting and filtering for Emacs.

;; List of completion styles to use.

(use-package prescient
  :ensure t
  :config
  (setq completion-styles '(prescient basic))
  ;; Number of recently selected candidates remembered and displayed
  ;; at the top of the list.
  (setq prescient-history-length 100) 

  ;; A list of algorithms to use for filtering candidates
  (setq prescient-filter-method '(literal regexp initialism))

  ;; Whether prescient.el sorts candidates that are fully matched before candidates that are partially matched.
  (setq prescient-sort-full-matches-first t))

(use-package vertico-prescient
  :after prescient
  :ensure t
  :config
  (vertico-prescient-mode 1))

(use-package corfu-prescient
  :after prescient
  :ensure t
  :config
  (corfu-prescient-mode 1))



;; prescient.el defines two faces: prescient-primary-highlight and prescient-secondary-highlight.
;; The primary highlight is used to highlight matches in candidates.
;; The secondary highlight is used for important sections within each matched region.
;; For example, the initialism filter method highlights the entire match with prescient-primary-highlight and each initial in the initialism with prescient-secondary-highlight.

;; These faces are used by the prescient completion style (and so completion frameworks using that style, such as Corfu and Vertico) and Selectrum. ivy-prescient.el uses Ivy's faces

;; The following example shows customizing these faces.
;; (let ((class '((class color) (min-colors 89))))
;;   (custom-theme-set-faces
;;    'doom-one
;;    `(corfu-current
;;      ((,class (:background "#48384c"
;;                            :weight bold
;;                            :foreground "#51afef"))))
;;    `(prescient-primary-highlight
;;      ((,class (:foreground "#c678dd"))))
;;    `(prescient-secondary-highlight
;;      ((,class (:foreground "#a9a1e1"))))))