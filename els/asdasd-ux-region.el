;; (use-package expreg
;;   :bind ("C-M-SPC" . expreg-expand)
;;   ("C-M-S-SPC" . expreg-contract))

(use-package expand-region

  :bind ;; ("C-M-SPC" . )
  ("C-M-S-SPC" . er/expand-region))
