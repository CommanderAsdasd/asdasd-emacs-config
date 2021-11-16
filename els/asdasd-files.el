(use-package 'dired-aux)


;;;###autoload
(defun doom--sudo-file-path (file)
  (let ((host (or (file-remote-p file 'host) "localhost")))
    (concat "/" (when (file-remote-p file)
                  (concat (file-remote-p file 'method) ":"
                          (if-let (user (file-remote-p file 'user))
                              (concat user "@" host)
                            host)
                          "|"))
            "sudo:root@" host
            ":" (or (file-remote-p file 'localname)
                    file))))

;;;###autoload
(defun doom/sudo-find-file (file)
  "Open FILE as root."
  (interactive "FOpen file as root: ")
  (find-file (doom--sudo-file-path file)))

;;;###autoload
(defun doom/sudo-this-file ()
  "Open the current file as root."
  (interactive)
  (find-file
   (doom--sudo-file-path
    (or buffer-file-name
        (when (or (derived-mode-p 'dired-mode)
                  (derived-mode-p 'wdired-mode))
          default-directory)))))

;;;###autoload
(defun doom/sudo-save-buffer ()
  "Save this file as root."
  (interactive)
  (let ((file (doom--sudo-file-path buffer-file-name)))
    (if-let (buffer (find-file-noselect file))
        (let ((origin (current-buffer)))
          (copy-to-buffer buffer (point-min) (point-max))
          (unwind-protect
              (with-current-buffer buffer
                (save-buffer))
            (unless (eq origin buffer)
              (kill-buffer buffer))
            (with-current-buffer origin
              (revert-buffer t t))))
      (user-error "Unable to open %S" file))))

(global-set-key (kbd "C-c C-f") 'find-file-at-point)



(use-package dired-filter
  ;; :hook (dired-mode dired-filter-mode)
  )

(use-package dired-du
  ;; :hook (dired-mode . dired-du-mode)
  )
 
(use-package dired-launch
  :config
  )

(defun xah-copy-file-path (&optional DirPathOnlyQ)
  "Copy current buffer file path or dired path.
Result is full path.
If `universal-argument' is called first, copy only the dir path.

If in dired, copy the current or marked files.

If a buffer is not file and not dired, copy value of `default-directory'.

URL `http://ergoemacs.org/emacs/emacs_copy_file_path.html'
Version 2018-06-18 2021-09-30"
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if DirPathOnlyQ
         (progn
           (message "Directory copied: %s" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: %s" $fpath)
         $fpath )))))

;; (defun asdasd-print-current-buffer ()
;;   "docstring"
;;   ;; (interactive "S")
;;   (curre)
;;   )

(defun asdasd/bookmark-filename (filename &optional $name)
  "bookmark FILENAME with NAME"
  (if $name () (setq $name filename))
   (bookmark-store $name (bookmark-set-filename (bookmark-make-record-default t t) filename) t)
    )

;; (asdasd/bookmark-filename "/home/")



(defun asdasd/bookmark-config-files ()
  "bookmarks asdasd.* files"
  
  (setq-local $dir-list (directory-files (concat user-emacs-directory "els") "^asdasd.*\.el$"))
  (dolist (filepath $dir-list)
          ( (file-name-nondirectory filepath)  filepath t)))

(asdasd/bookmark-config-files )

(use-package historyf)

(defun asdasd/helm-copy-filename (args)
  "docstring"
  (interactive "P")
  )


(asdasd/helm-copy-filename)

(global-auto-revert-mode t)

(provide 'asdasd-files)


