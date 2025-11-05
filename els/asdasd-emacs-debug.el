(use-package edebug
  :straight (:type built-in)
  :config (add-hook 'edebug-mode-hook #'asdasd-keys-meow-global-mode-off))

(use-package edebug-inline-result)

(use-package debug
  :bind ("D" . toggle-debug-on-error))

(use-package inspector
  :config )
