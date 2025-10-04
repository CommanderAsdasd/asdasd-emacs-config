(setq python-interpreter "python3")

(setq python-shell-interpreter "python3")

;; (use-package auto-virtualenvwrapper)

(use-package pyvenv
  :custom  (pyvenv-virtual-env-path-directories ""))

(use-package pyvenv-auto
  :config )


(use-package pippel)

(use-package pipenv
  :config )

;; (use-package elpy
;;   :init
;;   (elpy-enable)
;;   :bind*
;;   (:map org-mode-map
;;         ("C-c C-p" . org-previous-visible-heading))
;;   ;; (:map elpy-mode-map
;;   ;; ("C-c C-p" . run-python))
;;   :hook ((elpy-mode . flycheck-mode))
;;   :custom
;;   (elpy-shell-add-to-shell-history t)
;;   (elpy-shell-echo-output nil)
;;     (elpy-rpc-python-command "python3")
;;     (elpy-rpc-timeout 20))


(use-package python-mode
  :custom
  (comment-start "#")
  (xref-backend-functions '(elpy--xref-backend))
  :config
  (dolist (hook '(python-mode-hook python-ts-mode-hook))
    (add-hook hook
              (lambda ()
                (setq-local comment-start "# "
                            comment-end ""
                            comment-start-skip "#+\\s-*")))) ; [2025-08-18] hack to fix comments in wsl
  
  :bind*
  
  (:map python-mode-map
        ("C-x s p" . run-python)
        ("C-x s s" . python-shell-send-region)
        ("C-x s b" . python-shell-send-buffer)
        ("C-x s d" . python-shell-send-defun)
        ("C-x s p" . run-python))
  (:map python-ts-mode-map
        ("C-x s p" . run-python)
        ("C-x s s" . python-shell-send-region)
        ("C-x s b" . python-shell-send-buffer)
        ("C-x s d" . python-shell-send-defun)
        ("C-x s p" . run-python))
  :mode ("\\.py\\'" . python-ts-mode)
  )

(use-package poetry
  :config )

(provide 'asdasd-code-python)
