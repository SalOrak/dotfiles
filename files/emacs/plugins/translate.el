(use-package go-translate
  :config
  (use-package plz) ;; Use curl instead of url.el
  (setq gt-preset-translators
      `((ts-1 . ,(gt-translator
                  :taker (gt-taker :langs '(ca en) :text 'word :pick 'region :prompt nil)
                  :engines (gt-google-engine)
                  :render (gt-buffer-render)))
        (ts-2 . ,(gt-translator
                  :taker (gt-taker :langs '(en ca) :text 'sentence :prompt nil)
                  :engines (gt-google-engine)
                  :render (gt-buffer-render))))
      )

  (setq gt-default-translator
        (gt-translator
                  :taker (gt-taker :langs '(ca en) :text 'word :prompt nil)
                  :engines (gt-google-engine)
                  :render (gt-insert-render :type 'replace)))

  :general
  (:keymaps 'override
            "C-'" 'gt-do-translate
            "M-]" 'gt-do-setup
            )
  
  )








