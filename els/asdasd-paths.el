;; prepend PATH to environment

(setenv "PATH"  (concat
                 "C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

;; replace / with \\ in STRING
(defun replace-slash-with-backslash (string)
  ;; 
  (replace-regexp-in-string "/" "\\\\" string))

(replace-slash-with-backslash "C:/msys64/mingw64/bin")


;; interactively add current working directory to PATH environment variable
(defun asdasd-add-to-path-default-directory ()
  (interactive)
  (setenv "PATH"
          (concat
           (replace-slash-with-backslash (expand-file-name default-directory)) ";" (getenv "PATH"))))

;; add to PATH environment variable interactively
(defun asdasd-add-to-path (path)
  (interactive "DAdd to PATH: ")
  (setenv "PATH"
          (concat
           (replace-slash-with-backslash (expand-file-name path)) ";" (getenv "PATH"))))

(asdasd-add-to-path "C:\\Program Files\\Haskell Platform\\8.6.5\\bin")
(asdasd-add-to-path "C:\\Program Files\\GIMP 2\\bin")
(asdasd-add-to-path "C:\Program Files\GIMP 2\bin")

;; get directory where current buffer


;; (getenv "PATH")




