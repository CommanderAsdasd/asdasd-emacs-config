(require 'asdasd-code-elisp-function-name)

;; sync emacses across diff platforms
(defcustom asdasd-sync-local-config-dir "//Client/C$/Users/AleksandrTankovskii(/emacs-rsync-win-vdi-copy" "backup emacs dir on local pc")
(defcustom asdasd-sync-vdi-config-dir "/c/Users/C5405944/AppData/Roaming/.emacs.d/" "emacs dir on vdi")
(defcustom asdasd-sync-local-config-dir-ediff "~/.emacs.d.local" "dir of original local machine config")

(defun asdasd-sync-local-to-vdi ()
  (interactive)
  (async-shell-command (format "rsync -ravz --checksum -av %s %s" asdasd-sync-local-config-dir asdasd-sync-vdi-config-dir) (format "*%s*" (compile-time-function-name)) (format "*%s*" (compile-time-function-name))))

(defun asdasd-sync-vdi-to-local ()
  (interactive)
  (async-shell-command (format "rsync -ravz --checksum -av %s %s" asdasd-sync-vdi-config-dir asdasd-sync-local-config-dir) (format "*%s*" (compile-time-function-name)) (format "*%s*" (compile-time-function-name))))

(defun asdasd-sync-wsl-emacs-d-push ()
  (interactive)
  (async-shell-command "wsl -e bash -c \"cd /home/leksandrankovskii/.emacs.d; git push\"" "*wsl-push*" "*wsl-push*"))

(defun asdasd-sync-magit-ediff-compare-current-file ()
  (interactive)
    (magit-ediff-compare "linux-work-vdi" nil buffer-file-truename buffer-file-truename))


(defun asdasd-sync-ediff-compare-with-local-config ()
  "simple comparer of same config file between config instances"
  (interactive)
  (let ((path-from-config-dir-root (replace-regexp-in-string ".*emacs\.d.*?/" "" (buffer-file-name))))
    (ediff-files buffer-file-name (expand-file-name path-from-config-dir-root asdasd-sync-local-config-dir-ediff))))


(provide 'asdasd-sync)
