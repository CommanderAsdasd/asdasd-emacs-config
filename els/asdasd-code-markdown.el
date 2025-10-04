(use-package markdown-preview-mode)

(use-package markdown-mode)

(defun asdasd-extract-headings ()
  (interactive)
  (let ((files (directory-files "./" nil ".*md"))
        (headings '()))
    (dolist (file files)
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        (while (re-search-forward "^#+\\(.*\\)$" nil t)
          (push (concat (match-string  0) "\n") headings))))
    (with-current-buffer (generate-new-buffer (concat "*" "headings" (file-name-base buffer-file-name) "*"))      
      (insert (pp-to-string (nreverse headings)))))
  )

