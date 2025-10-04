(use-package lsp-mode

  :init (defun org-babel-edit-prep:python (babel-info)
  (setq-local buffer-file-name (->> babel-info caddr (alist-get :tangle)))
  (lsp))
  :hook
  (find-file . (lambda () (when (or (project-current) (projectile-project-root)) (lsp-deferred))))
  )

(use-package lsp-pyright
  :config )

(use-package consult-lsp
  :config )
