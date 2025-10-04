(require 's)

(use-package path-helper)

(defun asdasd-os-path-windize-path (path)
  "turn path to win"
  (interactive)
  (let* ((output (if current-prefix-arg "\"%s\"" "%s")))
    (kill-new (format output (string-replace "/" "\\" path)))))

  
  

(defun asdasd-os-path-windized-current-path ()
  (interactive)
  (asdasd-os-path-windize-path default-directory))

(defun asdasd-os-path-wslize-path (path)
  "turn path to win"
  (interactive "Mpath:")
  (kill-new (concat "\"" (replace-regexp-in-string "\\([[:alpha:]]\\):" "/mnt/\\1" path) "\"")))

(defun asdasd-os-path-wslized-current-path ()
  (interactive)
  (asdasd-os-path-wslize-path default-directory))

(defun asdasd-os-path-add-to-path (&optional dir append)
  "prepends (makes first) DIR to path. if APPEND then adds to end"
  (interactive (list (read-directory-name "add to PATH")))
    (let* ((append current-prefix-arg)
        (old-path (getenv "PATH"))
        (new-path (if append
                      (concat  old-path ";" dir)
                      (concat  dir ";" old-path))))
    (setenv "PATH" new-path)
    (add-to-list 'exec-path dir append)))



(defun asdasd-os-path-kill-path ()
  ""
  (interactive)
  (kill-new (getenv "PATH"))
  )


(defun asdasd-os-path-current-dir-to-path (dir)
  ""
  (interactive (list default-directory))
  (setenv "PATH" (concat (getenv "PATH") dir)))





(provide 'asdasd-os-path)
