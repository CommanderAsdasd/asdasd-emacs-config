(use-package helpful
  :straight t
  ;; :bind ("C-h f" . helpful-function)
  ;; ("C-h v" . helpful-variable)
  ;; ("C-h o" . helpful-symbol)
  ;; ("C-h ," . list-processes))
)

(use-package emacs
  :bind ("C-h" . help-command)
  ("C-h i" . consult-info))

(use-package inform)

(provide 'asdasd-ux-help)
