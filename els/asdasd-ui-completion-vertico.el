(use-package vertico
  :straight t
  :config (vertico-mode)
  :custom (vertico-sort-function 'vertico-sort-alpha)
  )


;; marginalia - annotations for completion candidates
(use-package marginalia
  :after vertico
  :straight t
  :config (marginalia-mode))
