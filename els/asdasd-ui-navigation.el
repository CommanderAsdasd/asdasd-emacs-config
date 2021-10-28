(use-package ace-link
  :config
  )

(use-package ace-window
  :config
  (define-key mq-map (kbd "q") 'ace-window)
  )

(use-package ace-jump-mode
  :config
  :bind
  ("M-q s" . ace-jump-mode)
  )

(provide 'asdasd-ui-navigation)
