;; set mingw bash as default shell
(setq shell-file-name "C:/msys64/usr/bin/bash.exe")

(use-package exec-path-from-shell)

(use-package bash-completion
   (bash-completion-setup)
   :config (bash-completion-setup))

(setq locale-coding-system 'windows-1251)
(prefer-coding-system 'windows-1251)
