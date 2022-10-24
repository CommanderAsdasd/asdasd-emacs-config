(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-backend "jedi")
  (setq elpy-rpc-python-command "python3")
  (setq elpy-rpc-virtualenv-path 'current)
  (setq elpy-rpc-timeout 10)
  ;; keybindings
    (define-key elpy-mode-map (kbd "C-c C-b") 'elpy-shell-send-buffer)
  )
