(use-package eglot
  ;; :after (flymake project)
  :config (add-hook 'python-mode-hook #'eldoc-mode)
  ;; (add-to-list 'eglot-server-programs
  ;;              '((python-mode python-ts-mode) . ("pylsp"))
  ;;              '((go-mode) . ("gopls")))
  ;; (add-to-list 'exec-path "/sapmnt/home/C5405944/go/bin")
  ;; (add-to-list 'exec-path "/sapmnt/home/C5405944/.local/bin/")
(add-to-list 'eglot-server-programs
               '(python-mode . ("basedpyright-langserver" "--stdio")))
  )

(provide 'asdasd-eglot)