(use-package yasnippet
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :config )

(use-package yasnippet-capf
  :config (add-to-list 'completion-at-point-functions #'yasnippet-capf)
  (add-hook 'org-mode-hook '(lambda () (add-to-list 'completion-at-point-functions #'yasnippet-capf))))

