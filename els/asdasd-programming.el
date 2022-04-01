

 (general-define-key      
 :mode "prog-mode"
 "C-c C-b" 'eval-buffer
 :prefix "M-q"
 "s" 'kmacro-call-macro
 )

(require 'ielm)

(defun ielm/clear-repl ()
  "Clear current REPL buffer."
  (interactive)
  (let ((inhibit-read-only t))
      (erase-buffer)
      (ielm-send-input)))

(define-key inferior-emacs-lisp-mode-map
  (kbd "M-RET")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-j")
  #'ielm-return)

(define-key inferior-emacs-lisp-mode-map
  (kbd "RET")
  #'electric-newline-and-maybe-indent)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<up>")
  #'previous-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "<down>")
  #'next-line)

(define-key inferior-emacs-lisp-mode-map
  (kbd "C-c C-q")
  #'ielm/clear-repl
  )

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :hook)

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred


;; (use-package subemacs-eval
;;   :ensure t )

;; (use-package makefile-executor
;;   :config)

(general-define-key
 :prefix "M-q e"
 "b" 'eval-buffer)

;; (use-package elisp-linter
;;   :ensure t
;;   :config )



(use-package java-snippets
  :ensure t)




;; (setq conda-anaconda-home (getenv "WORKON_HOME"))

;; ;; if you want interactive shell support, include:
;; (conda-env-initialize-interactive-shells)
;; ;; if you want eshell support, include:
;; (conda-env-initialize-eshell)o;; ;; if you want auto-activation (see below for details), include:
;; (conda-env-autoactivate-mode t))

(use-package smartparens
  :config 
 (add-hook 'prog-mode-hook 'smartparens-mode))




(use-package ini-mode
  :ensure t)

(use-package ahk-mode
  :ensure t)

(setq python-shell-interpreter "bash")
(setq python-shell-interpreter-args "-c \"python -i\"")

(use-package tree-sitter
  :ensure t
  :config 
(add-hook 'python-mode-hook #'tree-sitter-mode)
)

(use-package tree-sitter-langs
  :ensure t
  :config (tree-sitter-require 'python))

(use-package tree-edit
  :ensure t
  :config )

(use-package evil-tree-edit
  :config 
  (add-hook 'python-mode-hook #'evil-tree-edit-mode)
  (add-hook 'c++-mode-hook #'evil-tree-edit-mode))

(general-define-key "C-;" 'comment-line)




;; (require 'asdasd-programming-shell)
(require 'asdasd-programming-semantics)
(require 'asdasd-programming-macro)
(require 'asdasd-programming-lisp)
(require 'asdasd-programming-python)

(defun safely (form)
  "evals form safely"
  (condition-case nil
      (eval form)
      (error (message "programming-ass not loaded"))
    )
  )

(safely '(require 'asdasd-programming-ass))



(provide 'asdasd-programming)
