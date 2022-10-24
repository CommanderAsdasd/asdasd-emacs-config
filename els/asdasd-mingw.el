;; mingw windows hacks
;; set /mingw64/bin as the default path for executables
(when (eq system-type 'windows-nt)
  (let ((path (getenv "PATH")))
    (setenv "PATH" (concat (expand-file-name "C:\\msys64\\mingw64\\Bin;") path))))

(getenv "PATH")
