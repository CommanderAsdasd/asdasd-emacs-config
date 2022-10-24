;; describe-package at point
(defun describe-package-at-point ()
  "Show the package description of the package at point."
  (interactive)
    (let* ((package-name (symbol-name (symbol-at-point)))
             )
        (if package-name
            (describe-package package)
        (message "No package found at point"))))

(global-set-key (kbd "C-h C-P") 'describe-package-at-point)

(provide 'asdasd-doc)
