(use-package server
  :config (server-start))

(defun asdasd-ux-os-kill-premiere ()
  "kills hidden prem instance without task manager"
  (interactive)
  (start-process-shell-command "kill prem" nil "C:\\git\\bat-files\\kill-premiere.bat"))


(use-package system-packages
  :custom
  (system-packages-usesudo nil)
  (system-packages-noconfirm t)
  :bind
  (:map embark-identifier-map
              ("p" . system-packages-install)
              ("P" . system-packages-uninstall)))

(provide 'asdasd-ux-os)

