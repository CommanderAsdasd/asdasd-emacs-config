(use-package server
  :config (server-start))

(defun asdasd-ux-os-kill-premiere ()
  "kills hidden prem instance without task manager"
  (interactive)
  (let ((shell-file-name "cmd.exe"))
    (switch-to-buffer-other-window (process-buffer (start-process-shell-command (asdasd-ux-text-starize (compile-time-function-name))
                                                                                (asdasd-ux-text-starize (compile-time-function-name))
                                                                                "/C taskkill.exe /IM \"Adobe Premiere Pro.exe\" /f")))))


(defun asdasd-os-pacman-package-name-normalize (package-name)
  ""
  (replace-regexp-in-string ".*/" "" package-name))

(defun asdasd-os-pacman-filter-advice (&rest args)
  "Filter out the third argument."
  (let* ((args (car args))
         (name (nth 0 args)))
    (setf (nth 0 args) (asdasd-os-pacman-package-name-normalize name))
    args))

(advice-add 'system-packages-uninstall :filter-args #'asdasd-os-pacman-filter-advice)


(use-package system-packages
  :custom (system-packages-usesudo nil)
  (system-packages-noconfirm t))

(provide 'asdasd-ux-os)
