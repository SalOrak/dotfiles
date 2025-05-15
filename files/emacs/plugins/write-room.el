
(use-package olivetti
  :config
  (add-to-list 'olivetti-mode-on-hook #'(lambda ()(fontaine-set-preset 'olivetti)))
  (add-to-list 'olivetti-mode-off-hook #'(lambda ()(fontaine-set-preset 'code)))
  )

(use-package fontaine
  :config
  (setq fontaine-presets
        '(
          (regular)
          (code
           :default-family "Iosevka NF"
           :default-height 150)
          (olivetti
           :default-family "Iosevka NF"
           :default-height 300
           )
          ))
  )
