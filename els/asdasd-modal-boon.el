(use-package boon
  :bind (:map boon-insert-map ("C-c" . boon-set-command-state))

  
  (:map boon-command-map ((homerow-l . boon-smarter-backward)
                          (homerow-r . boon-smarter-forward)))
  :config
  (require 'boon-qwerty)
  (boon-mode))

(use-package multiple-cursors)

