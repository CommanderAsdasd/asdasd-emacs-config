(use-package erefactor
  :bind ("C-c e R" . erefactor-rename-symbol-in-buffer))

;; (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
(use-package elisp-def
  :bind ("C-c d" . elisp-def))

(use-package doctest
  :straight (:host github :repo "riscy/doctest"))

(use-package elisp-refs)

(use-package elisp-depmap
  :after elisp-refs
  :bind (("C-c M-d" . elisp-depmap-graphviz-digraph)
         ("C-c M-g" . elisp-depmap-graphviz)
         ("C-c M-s" . elisp-depmap-makesummarytable))
  :config ((elisp-depmap-exec-file "~/graphviz2.dot")))


(use-package edebug-inline-result
  :config )



(use-package emacs
  :preface
  (defun asdasd-code-elisp-get-functions-start-with (prefix)
    (interactive "Mprefix:") 
    (let ((name-functions '()))
      (mapatoms (lambda (symbol)
                  (when (and (functionp symbol)
                             (string-prefix-p prefix (symbol-name symbol)))
                    (push symbol name-functions))))
      name-functions))
  :bind
  ("C-c e r" . 'raise-sexp)
  ("C-c e b" . elisp-eval-region-or-buffer)
  ("C-c e d" . delete-selection-mode)
  ("C-c e i" . indent-pp-sexp)
  ("C-c e p" . electric-pair-mode)
  ("C-x C-g" . eval-defun)
  ("C-x C-y" . elisp-eval-region-or-buffer))


(use-package lispy
  :bind (:map lispy-mode-map-special
              ("k" . special-lispy-left)
              ("'" . special-lispy-right)
              ("o" . special-lispy-down)
              ("p" . special-lispy-up)
              ("l" . special-lispy-flow)))

(use-package inspector
  :config)

(use-package eros
  :config (eros-mode))

(use-package el-search
  :config )

(use-package edit-list
  :config )

(provide 'asdasd-code-elisp)
