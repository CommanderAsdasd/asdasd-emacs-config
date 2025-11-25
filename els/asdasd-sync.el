;; sync emacses across diff platforms

(defun asdasd-sync-with-local-config ()
  (interactive)
  (async-shell-command "rsync -ravz --checksum -av \"/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(/.emacs.d/\" ~/.emacs.d/"))


(provide 'asdasd-sync)
