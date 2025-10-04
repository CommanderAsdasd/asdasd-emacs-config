;; set mingw bash as default shell
(setq explicit-shell-file-name (executable-find "bash"))

(use-package exec-path-from-shell)

(use-package bash-completion
   :config (bash-completion-setup))

;; (setq locale-coding-system 'windows-1251)
;; (prefer-coding-system 'windows-1251)
