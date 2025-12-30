;;; extract from org node to keep its schema with plain howm

(defun anofr-first-heading ()
    (interactive)
    (save-excursion
          (without-restriction
            (goto-char (point-min))
            (setq title (or (org-get-title)
                            ;; No #+TITLE keyword.  If also no file-level :ID:,
                            ;; let the first heading stand for title.
                            (unless (and (org-before-first-heading-p)
                                         (org-entry-get nil "ID"))
                              (and (or (org-at-heading-p)
                                       (outline-next-heading))
                                   (org-get-heading t t t t)))))
            )))

(defun anofr-slugify-for-web (title)
  "From TITLE, make a filename slug meant to look nice as URL component.

A title like \"Löb\\='s Theorem\" becomes \"lobs-theorem\".

Diacritical marks U+0300 to U+0331 are stripped \(mostly used with Latin
alphabets).  Also stripped are all glyphs not categorized in Unicode as
belonging to an alphabet or number system."
  (require 'ol)
  (thread-last title
               (org-link-display-format)
               (string-glyph-decompose)
               (seq-remove (lambda (char) (<= #x300 char #x331)))
               (concat)
               (string-glyph-compose)
               (downcase)
               (string-trim)
               (replace-regexp-in-string "[[:space:]]+" "-")
               (replace-regexp-in-string "[^[:alnum:]\\/-]" "")
               (replace-regexp-in-string "\\/" "-")
               (replace-regexp-in-string "--*" "-")
               (replace-regexp-in-string "^-" "")
               (replace-regexp-in-string "-$" "")))


(defun anofr-rename-file ()
    (interactive)
    (let* ((buf (or (buffer-base-buffer) (current-buffer)))
           (path (file-truename (buffer-file-name)))
           (name (file-name-nondirectory path))
           (interactive (interactive-p))
           (slug (anofr-slugify-for-web (anofr-first-heading)))
       (new-name (concat slug ".org"))
      (new-path
            (file-name-concat (file-name-directory path)
                              new-name)))
  (cond
           ((equal path new-path)
            (when interactive
              (message "Filename already correct: %s" path)))
           ((string-empty-p slug)
            (when interactive
              (message "Filename would become blank: %s" path)))
           ((buffer-modified-p buf)
            (when interactive
              (message "Unsaved file, letting it be: %s" path)))
           ((find-buffer-visiting new-path)
            (error "Wanted to rename, but a buffer already visits target: %s"
                   new-path))
           ((or (not (file-writable-p path))
                (not (file-writable-p new-path)))
            (error "No permissions to rename file: %s"
                   path))
           ((or (not interactive)
                (y-or-n-p (format "Rename file '%s' to '%s'?" name new-name)))
            (rename-file path new-path)
            (with-current-buffer buf
              (set-visited-file-name new-path t t))
            (message "File '%s' renamed to '%s'" name new-name)))))

(provide 'asdasd-note-org-file-rename)

;; Local Variables:
;; read-symbol-shorthands: (("anofr-" . "asdasd-note-org-file-rename"))
;; End: