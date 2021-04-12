
;; (defun shell ()
;;   "run shell renamed"
;; )

;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))





;; Theme customize

(set-face-attribute 'lazy-highlight nil :foreground "black" :background "green" :weight 'bold)


(with-current-buffer (url-retrieve-synchronously
		      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
  (buffer-string))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

  (setenv "PRINTER" "PDFCreator")
    (cond ((eq system-type 'windows-nt)
       (setq ps-printer-name "PDFCreator")
       (setq ps-printer-name-option "-d")
       (setq ps-lpr-command "/bin/lpr")))

(progn 
   (setenv "GS_LIB" "c:/Program Files/gs/gs9.54.0/lib;c:/Program Files/gs/gs9.54.0/libc:/Program Files/gs/gs9.54.0/Resource/Font/")
   (setq ps-lpr-command "c:/Program Files/gs/gs9.54.0/bin/gswin64c.exe")
   (setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
   (setq ps-printer-name t))

()


;; (setq org-capture-templates
;;     '(;; Computing
;;         ("c" "Computing")
;;         ("ce" "Emacs" entry (file "c:/git/org-kasten/1-notes.org")
;;         "* TODO %t %?\n" :prepend t)
;;         ;; Exercise
;;         ("e" "Exercise")
;;         ("er" "Logging a run" table-line (file+olp "~/org/training/training.org" "Running" "Log")
;;             "| %t | %? | km | min + s | | |" :prepend t)
;;         ("ec" "Logging a cycle" table-line (file+olp "~/org/training/training.org" "Cycling" "Log")
;;             "| %t | %? | km | min + s | | |" :prepend t)))




(provide 'asdasd-unstable)
