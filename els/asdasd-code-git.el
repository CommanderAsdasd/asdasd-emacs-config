(use-package magit
  :straight t
  :config (shell-command "git config --global core.editor emacsclient")
  (shell-command "git config status.showUntrackedFiles all"))

(use-package git-gutter
  :config )

