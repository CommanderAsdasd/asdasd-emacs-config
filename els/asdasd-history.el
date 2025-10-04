(savehist-mode 1)

(use-package recentf
  :config (recentf-mode))

(use-package savehist
  :config (savehist-mode 1)
  (setq savehist-additional-variables '(kill-ring recentf-list search-ring regexp-search-ring org-capture--prompt-history)))
