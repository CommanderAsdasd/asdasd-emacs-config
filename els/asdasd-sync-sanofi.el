(defun asdasd-sync-sanofi-buffer-from-clipboard ()
  (let ((buf (generate-new-buffer "*clipboard contents*")))
    (with-current-buffer buf
      (insert (gui-get-selection 'CLIPBOARD)))
    buf))

(defun asdasd-sync-sanofi-buffer-from-list (name buffer-strings)
  (let ((buf (generate-new-buffer (format "*clipboard contents %s*" name))))
    (with-current-buffer buf
      (insert buffer-strings))
    buf))

(defun my/buffers-differ-p (buf1 buf2)
  "Return non-nil if BUF1 and BUF2 have different contents."
  (not
   (zerop
    (with-current-buffer buf1
      (compare-buffer-substrings
       buf1 (point-min) (point-max)
       buf2 (with-current-buffer buf2 (point-min))
       (with-current-buffer buf2 (point-max)))))))

(defun diff-buffer-with-clipboard ()
  "Diff current buffer against clipboard contents."
  (interactive)
  (let ((buf-a (current-buffer))
        (buf-b (asdasd-sync-sanofi-buffer-from-clipboard)))
    (unwind-protect
        (ediff-buffers buf-a buf-b)
      ;; Keep buf-b alive long enough for diff-buffers to read it.
      ;; It can be killed manually after diff is created.
      nil)))


(defun asdasd-sync-config-clipboard-copy-file (file)
  "select file to copy"
  (interactive "fSelect file:")
  (save-window-excursion
    (find-file file)
    (asdasd-sync-config-clipboard-copy)
    (message "copied %s" file)
    (save-buffer)))

(defun asdasd-sync-config-clipboard-copy ()
  (interactive)
  (kill-new (concat ";; " (file-name-nondirectory (buffer-file-name)) "\n" (buffer-string))))

(defun asdasd-sync-config-clipboard-paste ()
  (interactive)
  (let* ((buffer-lines (split-string (current-kill 0 t) "\n"))
         (first-line (car buffer-lines))
         (rest-buffer-lines  (mapconcat #'identity (cdr buffer-lines) "\n"))
         (file-name (string-trim-left first-line ";;+ *"))
         (file-path (expand-file-name file-name))
         (file-path-buffer (find-file-noselect file-path))
         (clipboard-buffer (asdasd-sync-sanofi-buffer-from-list file-name rest-buffer-lines))
         (clipboard-different  (my/buffers-differ-p clipboard-buffer file-path-buffer)))
    (when clipboard-different
      (ediff-buffers file-path-buffer clipboard-buffer))    
    ;; (save-window-excursion
    ;;   (find-file file-path)
    ;;   (backup-buffer)
    ;;   (erase-buffer)
    ;;   (insert rest-buffer-lines))
    
    ;; (message "updated %s from clipboard" file-path)
    
    ))
