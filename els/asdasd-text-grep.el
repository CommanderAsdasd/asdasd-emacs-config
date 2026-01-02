(use-package grep-a-lot)

(use-package wgrep
  :config )

(use-package ripgrep
  :bind
  ("C-c r r" . ripgrep-regexp)
  )

(use-package grep-context
  :hook (compilation-mode . grep-context-mode))