(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

;; truncate / in very beginning of string
(defun truncate-slash (in)
  ;; only do this if the string starts with /
    (if (string-match "^/" in)
        (replace-in-string "/" "" in)
        in))
  
;; if / found replace with \\
(defun escape-slash (in)
  (replace-in-string "/" "\\\\" in))

;; replace \ with \\
(defun escape-backslash (in)
  (replace-in-string "\\" "\\\\" in))

(defun windize-path (path)
  "turns path into windows format"
  (let* (path (truncate-slash path))
  ;; check if path contains / then replace with \\
    (if (string-match "/" path)
        (escape-slash path)
      (replace-in-string "/" "\\" (expand-file-name path)))))

(windize-path "/c/")
  
  ;; (search-forward "/" "\"\A
  ;; (string-match "/" path)  
  
  ;; (replace-in-string "/" "\\" )
   ;; (replace-in-string "\\" "\\\\" path))
  )

;; (windize-path "")

(defun asdasd-add-to-path (dir-path &optional args)
  "appends path to PATH envinronment variable"
  (interactive "DPath: ")
  
  (if (args)
      (setenv "PATH" (concat (getenv "PATH") ";" (windize-path dir-path)))
    (setenv "PATH" (concat (windize-path dir-path) ";" (getenv "PATH")))
    ))
