;; (defun xmodmap- (args)
;;   "docstring"
;;   (interactive "P")

;;   (setq-local xmodmap-command "clear lock
;;                                clear control
;;                                keycode 66 = Control_L
;;                                add control = Control_L Control_R")


;;   (async-shell-command (concat "sudo xmodmap << EOF "
;;                                xmodmap-command  
;;                                "EOF")
;;   ))

(defun asdasd-xmodmap (p)
  "apply xmodmap config
   choose "
  (setq-local def-config "~/xmodmap_alt.conf")
  (interactive "PfConfig:")
  (if p (setq-local config (read-file-name "xmodmap-config"))
    (setq-local config def-config))
  (async-shell-command (concat "xmodmap " config))) ;; i need a thing....i wanted variation in behavior - if no universal arg the




(defun globalconnect-connect (args)
  "wrapper for console globalconnect connection "
  (interactive "P")
  (switch-to-buffer-other-window "Globalconnect connection")
  (async-shell-command
   "GW=czech-republic-producti.gpgy2csyocc2.gw.gpcloudservice.com
gp-saml-gui -S --clientos=Linux --gateway $GW" "Globalconnect connection")
  )

(use-package syslog-mode
  :config
  )

(use-package journalctl-mode
  :config
  )

(use-package clipmon
  :config
  
  )                                     


(provide 'asdasd-linux)
