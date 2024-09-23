(use-package yasnippet
  :ensure t
  :general
  (leader-by-mode :keymaps '(yas-minor-mode-map)
    "s e" 'yas-expand
    "s c" 'yas-insert-snippet
    "s N" 'yas-new-snippet
    "s k" 'yas-abort-snippet
    "s n" 'yas-next-field
    "s p" 'yas-prev-field
    "s R" 'yas-reload-all
    )
  (:keymaps '(yas-minor-mode-map)
            "TAB" yas-maybe-expand
            "<tab>" yas-maybe-expand
            )
  :config
  (setq salorak/snippets-dir (concat salorak/home-dir "snippets/"))
  (setq yas-snippet-dirs '(salorak/snippets-dir))
  (setq yas-triggers-in-field nil)
  (yas-global-mode -1)
  :hook
  (LaTeX-mode . yas-minor-mode-on) ;; Activate YASnippets in LaTeX
  )

