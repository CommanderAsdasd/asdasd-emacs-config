(use-package wgrep
  :config (setq wgrep-auto-save-buffer t))

(use-package ripgrep
  :config )

(use-package xah-find
  :ensure t)


(require 'everything)
(global-set-key (kbd "C-c e") 'everything)

(setq everything-cmd "c:/Program Files/es/es.exe")

(provide 'asdasd-grep)
