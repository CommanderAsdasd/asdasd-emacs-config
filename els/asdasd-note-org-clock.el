(defun asdasd-note-org-clock-effort ()
  "create timer sized to effort of entry"
  (org-timer-set-timer (org-duration-to-minutes (org-entry-get nil "Effort"))))

