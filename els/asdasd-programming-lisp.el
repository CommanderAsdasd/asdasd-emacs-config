(use-package erefactor
  :config
  :ensure t) 

(defun asdasd/print-dir ()
  "docstring"
  (interactive)
  (let ((current-prefix-arg 4))
  (command-execute (read-directory-name "dir print")))
  )

(defun asdasd/print-file ()
  "docstring"
  (interactive)
  (let ((current-prefix-arg 4))
    (command-execute (read-file-name "file print"))))

(defun asdasd/print-variable (arg)
  "reads variable"
  (interactive "P")
  (if (equal current-prefix-arg nil)
      (insert (symbol-value (read-variable "print variable value:")))
    (insert (symbol-name (read-variable "print variable name:"))))
  )

(use-package lispy
  :ensure t
  :config (add-hook 'emacs-lisp-mode-hook lispy-mode))

(use-package evil-lispy
  :ensure t
  :after lispy)


(provide 'asdasd-programming-lisp)
