(defun record-buffer-creation-time ()
  (setq-local buffer-creation-time (current-time)))

(add-hook 'after-change-major-mode-hook #'record-buffer-creation-time)
