(require 'asdasd-multifiles)


(add-hook 'denote-after-new-note-hook 'org-id-get-create 1)

(defun asdasd-note-denote-howm-template ()
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

(defun asdasd-note-denote-embark-sequence-new-child (candidate)
  ""
  (denote-sequence-new-child candidate))

(defun asdasd-note-denote-rename-file-using-front-matter ()
  "add to after-save-hook"
  (when (denote-file-is-note-p (buffer-file-name)) (denote-rename-file-using-front-matter (buffer-file-name))))

(add-hook 'after-save-hook 'asdasd-note-denote-rename-file-using-front-matter)

(defun asdasd-note-denote-embark-reparent (candidate)
  (denote-sequence-reparent-recursive (denote-sequence-file-prompt
                                       (format "Reparent `%s' (recursively) to be a child of"
                                               (propertize
                                                candidate
                                                'face 'denote-faces-prompt-current-name)))

                                      candidate))

;;; sequence

(defcustom asdasd-note-denote-temp-sequence-number 2 "where to put journal files")

(defun asdasd-note-denote-sequence-reparent-to-current-recursive ()
     (interactive)
     (denote-sequence-reparent-recursive (denote-sequence-file-prompt
                                          (format "Reparent `%s' (recursively) to be a child of current"
                                                  (propertize
                                                   (denote--rename-dired-file-or-current-file-or-prompt)
                                                   'face 'denote-faces-prompt-current-name)))
                                         (buffer-file-name)))

(defun asdasd-note-denote-sequence-temp ()
  "create"
  (interactive)
  (denote-sequence-new-child (format "%d" asdasd-note-denote-temp-sequence-number)))

(defun asdasd-note-denote-completing-read-files (prompt initial)
       (completing-read prompt (denote-sequence-get-all-files) nil nil initial))

(defun asdasd-note-denote-sequence-find ()
  "find any file under howm-directory"
  (interactive)
  (find-file
   (let ((vertico-sort-override-function 'denote-sequence-sort-files))
     (asdasd-note-denote-completing-read-files "denote file:" (format "===%s" (or current-prefix-arg ""))))
   ;; (completing-read "howm note: " (directory-files-recursively denote-directory "\.org\\|\.md") nil nil (format "===" denote-sequence-alphanumeric-regexp))
   ))


(defun asdasd-note-denote-sequence-embark-multifile (candidate)
  "add CANDIDATE to multifile"
  (asdasd-multifile-mirror-file candidate))

(defun asdasd-note-denote-sequence-reparent-from-temp-to-permanent (&optional from to)
  (interactive (let* ((from (asdasd-note-denote-completing-read-files "reparent file:" "===2"))
                      (to (asdasd-note-denote-completing-read-files (format "reparent %s to:" from) "!===2")))
                 (list from to)))
  (denote-sequence-reparent-recursive from to))



(use-package denote
  :hook (dired-mode . denote-dired-mode)
  :bind*
  ("C-' n" . denote-open-or-create)
  ("C-' r" . denote-rename-file)
  ("C-' l" . denote-link)
  ("C-' b" . denote-backlinks)
  ("C-' d" . denote-dired)
  ("C-' g" . denote-grep)
  (:map embark-general-map
        ("r" . asdasd-note-denote-embark-reparent))
  (:map embark-general-map
        ("m" . asdasd-note-denote-sequence-embark-multifile))
  
  :custom
  (denote-rename-confirmations nil)
  (denote-templates
   `((howm . asdasd-note-denote-howm-template)))
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
            #'asdasd-note-denote-org-node-rename-ignore))

(use-package denote-search)

(defun asdasd-note-denote-sequence-find-parent ()
  (interactive)
  (denote-sequence-find 'parent))

(defun asdasd-note-denote-sequence-find-all-parents ()
  (interactive)
  (denote-sequence-find 'all-parents))

(defun asdasd-note-denote-sequence-find-children ()
  (interactive)
  (denote-sequence-find 'children))

(defun asdasd-note-denote-sequence-find-all-children ()
  (interactive)
  (denote-sequence-find 'all-children))

(defun asdasd-note-denote-sequence-find-siblings ()
  (interactive)
  (denote-sequence-find 'siblings))



(use-package denote-sequence
  :custom (denote-sequence-scheme 'alphanumeric)
  :bind*
  ("C-' s t" . asdasd-note-denote-sequence-temp)
  ("C-' s d" . denote-sequence-dired)
  ("C-' s p" . denote-sequence-new-parent)
  ("C-' s R" . denote-sequence-reparent)
  ("C-' s r" . denote-sequence-reparent-recursive)
  ("C-' s h" . denote-sequence-view-hierarchy)
  ("C-' s s" . denote-sequence)
  ("C-' s C" . denote-sequence-new-child)
  ("C-' s c" . denote-sequence-new-child-of-current)
  ("C-' s S-f" . denote-sequence-find)
  (:prefix-map asdasd-note-denote-sequence-find-prefix-map
               :prefix "C-' s f"
               ("f" . asdasd-note-denote-sequence-find)
               ("p" . asdasd-note-denote-sequence-find-parent)
               ("P" . asdasd-note-denote-sequence-find-all-parents)
               ("c" . asdasd-note-denote-sequence-find-children)
               ("C" . asdasd-note-denote-sequence-find-all-children)
               ("s" . asdasd-note-denote-sequence-find-siblings)))



(use-package consult-denote)

(use-package denote-agenda
  :custom (denote-agenda-include-regexp "todo")
  :config (denote-agenda-insinuate))


(provide 'asdasd-note-denote)
