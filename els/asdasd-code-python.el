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

;; (use-package elpy)


(use-package poetry
  :config )
