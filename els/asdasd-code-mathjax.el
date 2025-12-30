(use-package mathjax
  :config (add-hook 'eww-mode-hook #'mathjax-shr-setup))