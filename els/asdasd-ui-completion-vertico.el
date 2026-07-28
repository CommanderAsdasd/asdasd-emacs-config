(use-package vertico
  :straight t
  :config (vertico-mode)
  (vertico-sort--define (history) 32 (if (equal % "") 0 (/ (aref % 0) 4)) string< string<)
  )


;; marginalia - annotations for completion candidates
(use-package marginalia
  :after vertico
  :straight t
  :config (marginalia-mode))
