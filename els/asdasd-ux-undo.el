;; (use-package undo-tree
;;   :config (global-undo-tree-mode)

(use-package vundo
  :bind* ("С-\\". undo))

(use-package goto-last-change
  :bind ("C-M-?" . goto-last-change))
