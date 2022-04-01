(use-package outshine
  :ensure t
  :custom (outline-minor-mode-prefix (kbd "M-#"))
  :config 
  (add-hook 'emacs-lisp-mode-hook 'outshine-mode)
  )
