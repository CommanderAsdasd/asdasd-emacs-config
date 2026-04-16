(defcustom asdasd-note-denote-temp-sequence-number 12 "where to put journal files")

(add-hook 'denote-after-new-note-hook 'org-id-get-create 1)
(add-hook 'denote-after-new-note-hook 'org-insert-link 2)

(defun asdasd-note-denote-temp-sequence ()
  "create"
  (interactive)
  (denote-sequence-new-child (format "%d" asdasd-note-denote-temp-sequence-number)))


(defun my-denote-template-howm ()
  "Insert a howm-lkokike first heading with timestamp + title, then the file path."
  (let* ((file (or (buffer-file-name) ""))
         (type (and (stringp file) (denote-filetype-heuristics file)))
         (title (if (and (stringp file) type)

                  ""))
         (id (and (stringp file) (denote-retrieve-filename-identifier file)))
         ;; Denote default ID looks like: YYYYMMDDTHHMMSS
         (ts (if (and (stringp id) (>= (length id) 13))
                 (format "[%s-%s-%s %s:%s]"
                         (substring id 0 4)  (substring id 4 6)  (substring id 6 8)
                         (substring id 9 11) (substring id 11 13))
               (format-time-string "[%Y-%m-%d %H:%M]"))))
    (concat "* " ts " " title "\n"
            ;; " " file "\n"
            )))


(defun asdasd-note-denote-sequence-find ()
  "find any file under howm-directory"
  (interactive)
  (find-file
   (let ((vertico-sort-override-function 'denote-sequence-sort-files))
     (completing-read "denote-sequence" (denote-sequence-get-all-files) nil nil (format "===%s" (or current-prefix-arg ""))))
   ;; (completing-read "howm note: " (directory-files-recursively denote-directory "\.org\\|\.md") nil nil (format "===" denote-sequence-alphanumeric-regexp))
   ))

(defun asdasd-note-denote-embark-sequence-new-child (candidate)
  ""
  (denote-sequence-new-child candidate))

(use-package denote
  ;; :config (define-prefix-command 'asdasd-note-denote-sequence-map)
  :hook (dired-mode . denote-dired-mode)
  :bind*
  ("C-c n s t" . asdasd-note-denote-temp-sequence)
  ("C-c n n" . denote-open-or-create)
  ("C-c n s r" . denote-sequence-reparent)
  ("C-c n s d" . denote-sequence-dired)
  ("C-c n s p" . denote-sequence-new-parent)
  ("C-c n s P" . denote-sequence-reparent-recursive)
  ("C-c n s h" . denote-sequence-view-hierarchy)
  ("C-c n s s" . denote-sequence)
  ("C-c n s C" . denote-sequence-new-child)
  ("C-c n s c" . denote-sequence-new-child-of-current)
  ("C-c n s f" . asdasd-note-denote-sequence-find)
  ("C-c n s F" . denote-sequence-find)
  ("C-c n r completing-read" . denote-rename-file)
  ("C-c n l" . denote-link)
  ("C-c n b" . denote-backlinks)
  ("C-c n d" . denote-dired)
  ("C-c n g" . denote-grep)
  
  
  :custom
  (denote-rename-confirmations nil)
  (denote-templates
   `((howm . my-denote-template-howm)))
  (denote-use-template 'howm)
  (denote-directory (expand-file-name "~/howm"))
  (denote-dired-directories (list (expand-file-name "~/howm")))
  ;; Automatically rename Denote buffers when opening them so that
  ;; instead of their long file name they have, for example, a literal
  ;; "[D]" followed by the file's title.  Read the doc string of
  ;; `denote-rename-buffer-format' for how to modify this.
  :config
  (denote-rename-buffer-mode 0)
  ;; (add-hook 'howm-after-save-hook (lambda () (denote-change-file-type-and-front-matter (buffer-file-name) 'org)))
  (defun asdasd-note-denote-org-node-rename-ignore (orig-fn &rest args)
  (unless (and buffer-file-name
           (fboundp 'denote-file-is-note-p)
           (denote-file-is-note-p buffer-file-name))
    (apply orig-fn args)))

(advice-add 'org-node-rename-file-by-title :around
            #'asdasd-note-denote-org-node-rename-ignore)
  )

(use-package denote-search)

;; (use-package denote-folgezettel
;;   :straight (:host github :repo "MirkoHernandez/denote-folgezettel"))

(use-package denote-sequence
  :custom (denote-sequence-scheme 'alphanumeric))


(use-package consult-denote)

 

(use-package denote-agenda)

(provide  'asdasd-note-denote)