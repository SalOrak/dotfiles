;; Core keymaps
(defvar salorak/keymaps-list
  '(
    global
    by-mode
    evil
    consult
    ;; ivy
    compilation
    magit
    ;; projectile
    org
    org-agenda
    whaler-consult
    ;; whaler-counsel
    undo
    zoom
    shell-pop
    avy
    hydra
    transpose-frame
    )
  )

;; Load plugin keymaps 
(salorak/load-plugins salorak/keymaps-list 'keymaps)
