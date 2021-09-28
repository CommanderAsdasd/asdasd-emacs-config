(defun xmodmap- (args)
  "docstring"
  (interactive "P")

  (setq-local xmodmap-command "clear lock
                               clear control
                               keycode 66 = Control_L
                               add control = Control_L Control_R")


  (async-shell-command (concat "sudo xmodmap << EOF "
                               xmodmap-command  
                               "EOF")
  ))



(defun globalconnect-connect (args)
  "wrapper for console globalconnect connection "
  (interactive "P")
  (switch-to-buffer-other-window "Globalconnect connection")
  (async-shell-command
   "GW=czech-republic-producti.gpgy2csyocc2.gw.gpcloudservice.com
gp-saml-gui -S --clientos=Linux --gateway $GW" "Globalconnect connection")
  )


(provide 'asdasd-linux)
