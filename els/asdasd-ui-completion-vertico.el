(use-package vertico
  :straight t
  :config (vertico-mode)
  )


;; marginalia - annotations for completion candidates
(use-package marginalia
  :after vertico
  :straight t
  :config (marginalia-mode))
