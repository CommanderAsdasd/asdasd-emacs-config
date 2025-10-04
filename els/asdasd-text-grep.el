(use-package grep-a-lot)

(use-package wgrep
  :config )

(use-package ripgrep
  :bind ("C-c r r" . consult-grep)
  ("C-c r e" . consult-everything)
  )
