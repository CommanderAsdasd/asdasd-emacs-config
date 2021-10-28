
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

(use-package enlive
  :config

  )

(use-package 'enlive)
(use-package 'seq)

(defun ar/scrape-links-from-clipboard-url ()
  "Scrape links from clipboard URL and return as a list. Fails if no URL in clipboard."
  ;; (interactive "P")
  (unless (string-prefix-p "http" (current-kill 0))
    (user-error "no URL in clipboard"))
  (thread-last (enlive-query-all (enlive-fetch (current-kill 0)) [a])
    (mapcar (lambda (element)
              (string-remove-suffix "/" (enlive-attr element 'href))))
    (seq-filter (lambda (link)
                  (string-prefix-p "http" link)))
    (seq-uniq)
    (seq-sort (lambda (l1 l2)
                (string-lessp (replace-regexp-in-string "^http\\(s\\)*://" "" l1)
                              (replace-regexp-in-string "^http\\(s\\)*://" "" l2))))))


(defun ar/view-completing-links-at-clipboard-url ()
  "Scrape links from clipboard URL and open all in external browser."
  (interactive)
  (browse-url (completing-read "links: "
                               (ar/scrape-links-from-clipboard-url))))


(provide 'asdasd-unstable)
