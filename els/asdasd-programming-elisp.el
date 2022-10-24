(use-package erefactor
  :config
  :ensure t)

;; * defuns




(defun asdasd/execute-last-command (&optional arg)
  "executes last command without prompt"
  (interactive)
  (if arg (setq-local arg 1) ())
  (cl-reduce #'call-interactively (nth arg command-history)))
  
(defun)

;; * use-package declarations

(use-package lispy
  :ensure t
  :config (add-hook 'emacs-lisp-mode-hook #'lispy-mode)
  (add-hook 'emacs-lisp-mode-hook #'lispy-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
  )

(use-package evil-lispy
  :ensure t
  :after lispy)

(provide 'asdasd-programming-elisp)



;; * keys
(general-define-key
 :prefix-command 'asdasd/--execute-prefix 
 "M-q e" 'asdasd/--execute-prefix
 :prefix "M-q e"
 "l" 'asdasd/execute-last-command)
