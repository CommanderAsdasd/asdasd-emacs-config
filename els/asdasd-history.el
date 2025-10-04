(savehist-mode 1)

(use-package recentf
  :config (recentf-mode))

(use-package savehist
  :config (savehist-mode 1)
  (setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring org-capture--prompt-history shell-command-history comint-input-ring)))
