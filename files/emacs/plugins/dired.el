;; Dired mods
(require 'dired-x)

(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

;; Open another Dired window to copy there. REALLY Useful.
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh")
