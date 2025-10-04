(defun asdasd-note-org-table-insert-timestamp (&optional arg)
  "arg arg for relative days from current date"
  (interactive "p")
  (let ((timestamp (decode-time)))
    (org-insert-timestamp
     (encode-time `(,(nth 0 timestamp) ,(nth 1 timestamp) ,(nth 2 timestamp)
                    ,(+ (nth 3 timestamp) arg) ,(nth 4 timestamp) ,(nth 5 timestamp))))))





(defun asdasd-note-org-table-insert-rows-with-timestamp (n arg)
  "Insert N rows with N * 7 days timestamps into current table. If arg then"
  (interactive "nNumber of rows: \nN")
  (dotimes (i n)
  (org-table-insert-row -1)
  (asdasd-note-org-table-insert-timestamp (+ i (* i 6) arg)))
  (org-cycle)
  )




(provide 'asdasd-note-org-table)
