;; Create .http files to test against API
(use-package restclient
  :ensure t
  :mode
  ("\\.http\\'" . restclient-mode)
  )
