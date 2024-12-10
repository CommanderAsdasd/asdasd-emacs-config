(use-package avy
  :custom (avy-timeout-seconds 2)
  :bind*
  ("M-I" . avy-goto-char-timer))

(use-package avy-zap)

(use-package link-hint
  :bind
  (:map asdasd-avy-map
          ("l" . link-hint-open-link)))
