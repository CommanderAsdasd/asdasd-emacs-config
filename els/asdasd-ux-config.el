(require 'pp)

(defun asdasd-ux-config-get-modules-with-submodules ()
  "second part of file name in ELS dir"
  (interactive)
  (let* ((modules-file-name-parts (mapcar (lambda (module-file-name) (split-string (file-name-base module-file-name) "-"))

                                          (directory-files els))

                                  )

         (top-modules (list '()))

         (add-to-top-modules (lambda (key value)

                               "Add VALUE to the list associated with KEY in TOP-MODULES."

                               (let ((entry (assoc key top-modules)))

                                 (if entry

                                     ;; If the entry exists, append the value to the existing list

                                     (unless (member value (cdr entry)) ; Avoid duplicates

                                       (setcdr entry (cons value (cdr entry))))

                                   ;; If the entry does not exist, create a new one

                                   (push (cons key (list value)) top-modules))))))



    (mapcar (lambda (module-file-name-part) (if (> (length module-file-name-part) 1) (funcall add-to-top-modules (nth 1 module-file-name-part) (nth 2 module-file-name-part)) )) modules-file-name-parts)

    top-modules))

(defun asdasd-ux-config-get-modules ()

  "second part of file name in ELS dir"

  (interactive)

  (let ((modules-file-name-parts (mapcar (lambda (module-file-name) (split-string (file-name-base module-file-name) "-")) (directory-files els))

                                 ))

    (pp (-uniq (mapcar (lambda (module-file-name-part) (if (> (length module-file-name-part) 1) (nth 1 module-file-name-part) )) modules-file-name-parts)))))




(defun asdasd-ux-config-rename ()
  "rename file in els dir"
  (interactive)
  (let* ((default-directory els)) (call-interactively 'rename-file)))


(defun asdasd-ux-config-find ()
  "loads file from els dir"
  (interactive)
  (let ((default-directory els)) (call-interactively 'find-file)))



(defun asdasd-ux-config-grep ()
  "grep els dir"
  (interactive)
  (consult-ripgrep els))

;; (use--map asdasd-ux-config-keymap-prefix)


;; (defmacro toggle (var)

;;   `(setq ,var (not var)))

(defun asdasd-ux-config-load (&optional files)
  "loads file from els dir
  FILES is a list"
  (interactive)
  (let ((default-directory els)) (if files (mapc (lambda (file) (unwind-protect (load-file file))) files) (call-interactively 'load-file))))


(defun asdasd-ux-config-require (&optional files)
  "requires FILES from els dir
  FILES is a list"
  (interactive)
  (let ((default-directory els))
    (if files
        (mapc (lambda (file) (unwind-protect (require (file-name-base file)))) files)
      (require (intern (file-name-base (read-file-name "require: ")))))))

;; (mapcar (lambda (x) (let* ((filenames-parts (string-split x "-"))
;;                                                       )
;;                       (mapcar
;;                                             (lambda (filename-parts)
;;                                               (if
;;                                                   (> (length filename-parts) 3) (nth 0 filename-parts) '()))
;;                                             filenames-parts)))
        
;;         (directory-files default-directory))


(use-package emacs  
  :bind
  ("C-c m g" . asdasd-ux-config-grep)
  ("C-c m m" . asdasd-ux-config-find)
  ("C-c m l" . asdasd-ux-config-load)
  ("C-c m r" . asdasd-ux-config-require)
  ("C-c m R" . asdasd-ux-config-rename))

(provide 'asdasd-ux-config)


