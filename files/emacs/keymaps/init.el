;; Core keymaps


;; (leader-global 'normal 'override
;;   "s" 'eval-last-sexp
;;   "g" 'general-describe-keybindings
;;   "k" 'counsel-descbinds
;;   "a" 'salorak/absolute-buffer-name-on-clipboard
;;   "n" 'salorak/buffer-name-on-clipboard
;;   "i" 'nerd-icons-insert
;;   )

(defvar salorak/keymaps-list
  '(
    global
    by-mode
    ;; consult
    evil
    ivy
    compilation
    magit
    ;; projectile
    org
    org-agenda
    whaler
    undo
    zoom
    shell-pop
    avy
    hydra
    )
  )

;; Load plugin keymaps 
(salorak/load-plugins salorak/keymaps-list 'keymaps)
