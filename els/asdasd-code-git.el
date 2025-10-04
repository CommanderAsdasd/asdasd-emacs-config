(use-package magit
  :straight t
  :config (shell-command "git config --global core.editor emacsclient")
  (shell-command "git config status.showUntrackedFiles all")
  (shell-command (format "git config --global user.name \"%s\"" user-full-name))
  (shell-command (format "git config --global user.email \"%s\"" user-mail-address)))
(use-package git-gutter)

(use-package git)

