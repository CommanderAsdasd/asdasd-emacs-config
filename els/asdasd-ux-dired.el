(use-package dired
  :straight nil
  :config (add-hook 'dired-mode-hook 'dired-hide-details-mode)
  (add-hook 'dired-mode-hook 'auto-revert-mode)
  (dired-async-mode))


(use-package dired-filter)

(use-package dired-ranger)

(use-package virtual-dired
  :config )
