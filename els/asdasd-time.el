
(defun asdasd-time-get-date (&optional days-from format)
  "gets today or DAYS-FROM today in FORMAT"
  (let ((format (if format format "%y-%m-%d")))
    (format-time-string format (time-subtract (current-time) (days-to-time (if days-from days-from 0))))))

(provide 'asdasd-time)
