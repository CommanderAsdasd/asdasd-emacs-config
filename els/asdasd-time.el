(defun asdasd-time-get-date (&optional days-from)
  "today or DAYS-FROM today"
  (format-time-string "%y-%m-%d " (time-subtract (current-time) (days-to-time (if days-from days-from 0)))))

(provide 'asdasd-time)
