(use-package magit
  :straight t
  :config (shell-command "git config --global core.editor emacsclient")
  (shell-command "git config status.showUntrackedFiles all")
  (shell-command (format "git config --global user.name \"%s\"" user-full-name))
  (shell-command (format "git config --global user.email \"%s\"" user-mail-address)))

(defun asdasd-code-git-vc-visit-repo-website ()
  (interactive)
  (browse-url-xdg-open (vc-git-repository-url "."))
)

(use-package git-gutter
  (global-git-gutter-mode))

(use-package git)

