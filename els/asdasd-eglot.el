(use-package eglot
  ;; :after (flymake project)
  :config (add-hook 'python-mode-hook #'eldoc-mode)
  (add-to-list 'eglot-server-programs
               '((python-mode python-ts-mode) . ("pylsp")))
)
