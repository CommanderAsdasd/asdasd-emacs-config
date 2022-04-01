(add-to-list 'exec-path "c:/msys64/mingw32/bin/")
(setenv (concat (getenv "PATH") (subst-char-in-string ?/ ?\\ "/usr/bin/;C:/msys64/mingw32/bin/") ))
(setenv ())

(provide 'asdasd-config-paths)

