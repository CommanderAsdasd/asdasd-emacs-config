(defun asdasd-emacs-debug-edebug-instrument-function (function)
  (interactive "aEdebug instrument: ")
  (edebug-instrument-function function)) 

(use-package edebug
  :straight (:type built-in)
  :bind
  (:map embark-command-map ("D" . asdasd-emacs-debug-edebug-instrument-function))
  (:map embark-function-map ("D" . asdasd-emacs-debug-edebug-instrument-function))
  :config (add-hook 'edebug-mode-hook #'asdasd-keys-meow-global-mode-off))

(use-package edebug-inline-result)

(use-package debug
  :bind ("D" . toggle-debug-on-error))

(use-package inspector
  :config )

(provide 'asdasd-emacs-debug)