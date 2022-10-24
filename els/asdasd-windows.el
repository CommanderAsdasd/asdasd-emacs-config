                                        ; Paths
(setenv (concat "C:\\msys64\\usr\\bin\\"
                (getenv "PATH"))
        )


;;         (concat "c:/Windows/System32/"
;;                 "c:/Program Files/es/"
;;                 "c:/tree-sitter/."
;;                 "c:/msys64/mingw64/bin/"
;;                 "C:\\msys64\\mingw64\\bin"
;;                 
;;                 )
;;         )

;; "C:\\msys64\\mingw64\\bin;C:\\msys64\\usr\\local\\bin;C:\\msys64\\usr\\bin;C:\\msys64\\usr\\bin;C:\\Windows\\System32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\;C:\\msys64\\usr\\bin\\site_perl;C:\\msys64\\usr\\bin\\vendor_perl;C:\\msys64\\usr\\bin\\core_perl;C:\\msys64\\mingw32\\bin\\;C;C:\\Users\\asdasd\\Documents\\Downloads\\Rack-SDK;C:\\msys64\\home\\asdasd\\.pyenv\\pyenv-win\\bin;C:\\Program Files\\SuperCollider-3.10.3\\sclang.exe"

(setq everything-cmd "c:/Program Files/es/es.exe")


(defun shell-bash ()
  "Run cygwin bash in shell mode."
  (interactive)
  (let ((explicit-shell-file-name "C:/msys64/usr/bin/bash.exe"))
    (call-interactively 'shell)))


(defun shell-cmd ()
  "run windows cmd "
  (interactive)
  (let ((explicit-shell-file-name "c:/Windows/System32/cmd.exe"))
    (call-interactively 'shell))
  )

(defun shell-plink (args)
  "docstring"
  (interactive)
  (let ((explicit-shell-file-name "c:/Windows/System32/cmd.exe"))
    (call-interactively 'shell))
  )

;; 

;; rusification

;; ;; ”станавливаем €зыковую среду
;; (set-language-environment 'Cyrillic-CP)
;; ;; ”станавливаем кодировки по умолчанию дл€ файлов, буферов и обмена с внешними программами
;; (setq default-buffer-file-coding-system 'koi8-r)
;; (prefer-coding-system 'koi8-r)
;; (define-coding-system-alias 'koi8-u 'koi8-r)
;; (set-terminal-coding-system 'koi8-r)
;; (set-keyboard-coding-system 'koi8-r)

;; ;; следующие две строки использовать с осторожностью:
;; ;; не рекомендую глобально мен€ть значени€ coding-system-for-read & coding-system-for-write,
;; ;; например, это может отразитьс€ на кодировке при общении по сети. 
;; ;; эти переменные обычно используютс€ только дл€ конкретных I/O операций.
;; ;; см. документацию и bug #28780
;; (setq-default coding-system-for-read 'koi8-r)
;; (setq-default coding-system-for-write 'koi8-r)

;; (setq selection-coding-system 'koi8-r)
;; (setq default-process-coding-system
;;    (if (string> (substring emacs-version 0 2) "21") '(koi8-r . koi8-r) 'koi8-r))
;; (put-charset-property 'cyrillic-iso8859-5 'preferred-coding-system 'koi8-r)
;; ;; ѕоддержка русской кодировки MS Windows
;; (codepage-setup 1251)  
;; (define-coding-system-alias 'windows-1251 'cp1251)
;; (define-coding-system-alias 'win-1251 'cp1251)
;; (set-input-mode nil nil 'We-will-use-eighth-bit-of-input-byte)


(use-package w32-symlinks
  :el-get t
  :config (add-hook 'dired-load-hook
	        (lambda () (require 'w32-symlinks))))
ll-interactively 'shell))
  (insert cmd)
  (comint-send-input)
)


;; run commmand with cmd.exe
(defun run-cmd (cmd)
  (interactive "sCommand: ")
  (let ((explicit-shell-file-name "c:/Windows/System32/cmd.exe"))
    (call-interactively 'shell))
  (insert cmd)
  (comint-send-input)
  )

(defun asdasd-windows-mklink (link)
  "creates windows link"
  (interactive "P")

  
  ;; set cmd shell as default
  
  
  (let* (($type (read-string "/D: Dir"))
    ($link (read-file-name "link (points to)"))
           ($file (read-file-name "(points to) file"))
           )
    (with-temp-buffer
      (run-cmd
     (concat (format "mklink.exe %s \"%s\" \"%s\"" $type $link $file) "\\"  "&")
		           ))))



(when (string-equal system-type "windows-nt")
  (let (($paths (list "C:/msys64/usr/bin"
                      "C:/Program Files (x86)/Emacs/emacs/bin/"
                      "C:/Program Files (x86)/Emacs/EmacsW32/gnuwin32/bin/"
                      "C:/Windows/system32/"
                      "C:/Windows/"
                      "C:/Windows/System32/Wbem/"
                      "C:/Windows/system32/WindowsPowerShell/v1.0/"
                      )))
    (print $paths)
    (cl-loop for $elem in $paths do
             (add-to-list 'exec-path $elem))))

(getenv "PYHTONPATH")
(setenv "PYHTONPATH")               

(provide 'asdasd-windows)
