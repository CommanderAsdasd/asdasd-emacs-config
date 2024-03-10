(use-package avy
  :custom (avy-timeout-seconds 2)
  :init (setq asdasd-avy-map (make-sparse-keymap))
  :bind-keymap*
  ("M-J" . asdasd-avy-map)
  :bind
  (:map asdasd-avy-map
          ("j" . avy-goto-char-timer)
          ))

(use-package avy-zap)

(use-package link-hint
  :bind
  (:map asdasd-avy-map
          ("l" . link-hint-open-link)))
