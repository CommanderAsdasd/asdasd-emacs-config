;; sync emacses across diff platforms

(defun asdasd-sync-with-local-config ()
  (interactive)
  (async-shell-command "rsync -ravz --checksum -av \"/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(/.emacs.d/\" ~/.emacs.d/"))

(defun asdasd-sync-wsl-emacs-d-push ()
  (interactive)
  (async-shell-command "wsl -e bash -c \"cd /home/leksandrankovskii/.emacs.d; git push\"" "*wsl-push*" "*wsl-push*"))


(provide 'asdasd-sync)
