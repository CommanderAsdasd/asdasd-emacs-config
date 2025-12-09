;; sync emacses across diff platforms

(defun asdasd-sync-with-local-config ()
  (interactive)
  (async-shell-command "rsync -ravz --checksum -av \"/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(/.emacs.d/\" ~/.emacs.d/"))

(defun asdasd-sync-wsl-emacs-d-push ()
  (interactive)
  (async-shell-command "wsl -e bash -c \"cd /home/leksandrankovskii/.emacs.d; git push\"" "*wsl-push*" "*wsl-push*"))

(defun asdasd-sync-ediff-compare-current-file ()
  (interactive)
    (magit-ediff-compare "linux-work-vdi" nil buffer-file-truename buffer-file-truename))

(provide 'asdasd-sync)
