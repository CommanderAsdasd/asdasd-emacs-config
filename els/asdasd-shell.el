;; (global-set-key (kbd "M-&") (lambda (args) (interactive "SAsync Shell Command:")) (async-shell-command args (format "*%s*" args)))




(use-package bash-completion)
