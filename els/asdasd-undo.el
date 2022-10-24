;; (use-package undo-tree
;;   :ensure t
;;   :custom
;;   (undo-tree-auto-save-history t)
;;   (undo-tree-enable-undo-in-region t)
  
;;   :config (global-undo-tree-mode)
;;   (general-define-key "M-q u" 'undo-tree-visualise)
;;   )

(use-package vundo
  :ensure t
  :config (general-define-key "C-x u" 'vundo))

