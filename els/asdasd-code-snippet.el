(use-package yasnippet
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :config )

(use-package yasnippet-capf
  :bind ("C-c x" . yasnippet-capf)
  :config
  (add-to-list 'completion-at-point-functions #'yasnippet-capf)
  )

