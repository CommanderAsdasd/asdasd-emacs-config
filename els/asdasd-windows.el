(setq everything-cmd "c:/Program Files/es/es.exe")



(defun shell-bash ()
  "Run cygwin bash in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/msys64/usr/bin/bash.exe"))
    (call-interactively 'shell)))


(defun shell-cmd ()
  "run windows cmd "
  (interactive)
  (let ((explicit-shell-file-name "c:/Windows/System32/cmd.exe"))
    (call-interactively 'shell))
  )



;; (defun )
