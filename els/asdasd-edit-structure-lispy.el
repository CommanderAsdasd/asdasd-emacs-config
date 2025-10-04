(use-package lispy
  :hook (emacs-lisp-mode . lispy-mode)
  :bind (:map lispy-mode-map 
              (homerow-r . special-lispy-left)
              (homerow-l . special-lispy-right)
              (homerow-d . special-lispy-down)
              (homerow-u . special-lispy-up)))
