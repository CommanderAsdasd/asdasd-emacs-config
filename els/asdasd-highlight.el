(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))



