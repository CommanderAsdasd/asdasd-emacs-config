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
  :config
  (global-git-gutter-mode))

(use-package git)

(defun magit-stash-edit-message (stash message)
  "Change STASH's message to MESSAGE."
  (interactive
   (let* ((stash (magit-read-stash "Rename"))
          (old-msg (magit-git-string "show" "-s" "--format=%s" stash)))
     (list stash (magit-read-string "Stash message" old-msg))))
  (let ((commit (magit-rev-parse stash))
        (inhibit-magit-refresh t))
    (magit-stash-drop stash)
    (magit-stash-store message "refs/stash" commit))
  (magit-refresh))

(use-package diff-hl)