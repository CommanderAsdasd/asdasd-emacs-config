(use-package comment-tags
  :ensure t)

(use-package yaml
  :ensure t)


;; (defun shell ()
;;   "run shell renamed"
;; )

;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))





;; Theme customize




;; (with-current-buffer (url-retrieve-synchronously 
;; 		      "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;   (buffer-string))



 
;;   (setenv "PRINTER" "PDFCreator")
;;     (cond ((eq system-type 'windows-nt)
;;        (setq ps-printer-name "PDFCreator")
;;        (setq ps-printer-name-option "-d")
;;        (setq ps-lpr-command "/bin/lpr")))

;; (progn 
;;    (setenv "GS_LIB" "c:/Program Files/gs/gs9.54.0/lib;c:/Program Files/gs/gs9.54.0/libc:/Program Files/gs/gs9.54.0/Resource/Font/")
;;    (setq ps-lpr-command "c:/Program Files/gs/gs9.54.0/bin/gswin64c.exe")
;;    (setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
;;    (setq ps-printer-name t))


;; (("^file:///" . dnd-open-local-file)
;;  ("^file://" . dnd-open-file)
;;  ("^file:" . dnd-open-local-file)
;;  ("^\\(https?\\|ftp\\|file\\|nfs\\)://" . dnd-open-file))

;; (setq dnd-protocol-alist '(("^file:" . dnd-insert-filename)))

;; (defun dnd-insert-filename (uri _action)
;;   (insert (dnd-get-local-file-name uri)))









(setq everything-cmd "c:/Program Files/es/es.exe")


(defun shell-command-on-buffer (command)
  (interactive "sShell command on buffer: ")
  (shell-command-on-region (point-min) (point-max) command t))


(provide 'asdasd-unstable)



;; (defun asdasd/path-windize (path)
;;   "turn path windows-explorer-formatted, kills result"
;;   (interactive "S")
;;   (kill-new (replace-match "/" "\\")))
