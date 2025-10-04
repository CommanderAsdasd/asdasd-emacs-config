(use-package emacs
  :bind ;; ("C-M-;" . )
  :custom (parens-require-spaces nil))


(use-package outline
  :config (add-hook 'prog-mode 'outline-minor-mode))

(use-package nocomments-mode)

(use-package outline-indent
  :config   (add-hook 'yaml-mode-hook #'outline-indent-minor-mode)
  (add-hook 'yaml-ts-mode-hook #'outline-indent-minor-mode))

(use-package comint
  :type built-in
  )

(provide 'asdasd-code)
