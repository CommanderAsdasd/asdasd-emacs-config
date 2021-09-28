(defun asdasd-async-shell (buf)
  "docstring"
  (interactive "SShell command: ")
  (switch-to-buffer-other-window (concat "asdasd-async-shell: " buf))
  (async-shell-command buf)
  )

(global-set-key (kbd "M-!") 'asdasd-async-shell)

(provide 'asdasd-shell)
