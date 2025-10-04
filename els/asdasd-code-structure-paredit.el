(use-package paredit
  :hook
  (emacs-lisp-mode                  . paredit-mode) ; Elisp buffers.
  (lisp-mode                        . paredit-mode) ; Common Lisp buffers.
  (lisp-interaction-mode            . paredit-mode) ; Scratch buffers.
  (ielm-mode-hook                   . paredit-mode) ; ELM buffers.
  (eval-expression-minibuffer-setup . paredit-mode) ; Eval minibuffers.
  :bind
  (:map paredit-mode-map
        ("<return>" . my/paredit-RET))
  :config
  (unbind-key (kbd "M-J"))
  (defun my/paredit-RET ()
    "Wraps `paredit-RET' to provide a sensible minibuffer experience."
    (interactive)
    (if (minibufferp)
        (read--expression-try-read)
      (paredit-RET))))

