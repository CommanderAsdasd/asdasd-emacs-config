(use-package server
  :config (server-start))

(defun asdasd-ux-os-ubuntu-p ()
  (when (eq system-type 'gnu/linux)
    (when (string-match "Ubuntu" (shell-command-to-string "lsb_release -d 2>/dev/null"))
      t)))


(defun asdasd-ux-os-kill-premiere ()
  "kills hidden prem instance without task manager"
  (interactive)
  (start-process-shell-command "kill prem" nil "C:\\git\\bat-files\\kill-premiere.bat"))





(use-package system-packages
  :custom
  (system-packages-usesudo nil)
  (system-packages-noconfirm nil)
  :bind
  (:map embark-identifier-map
        ("p" . system-packages-install)
        ("P" . system-packages-uninstall))
  
  :config (when (asdasd-ux-os-ubuntu-p)
            (setq system-packages-package-manager 'apt
                  system-packages-use-sudo t))

  (advice-add 'system-packages-install :around
            (lambda (orig-fn &rest args)
              (let ((system-packages-noconfirm t)
                    ) ;; suppress prompts
                (apply orig-fn args)))))


;; (defun asdasd-ux-os-system-package-install ()
;;   (call-interactively system-packages-install)
;;   )


(provide 'asdasd-ux-os)

