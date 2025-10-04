(require 'asdasd-note-org-node)

(use-package org
  :custom (org-agenda-sorting-strategy '((agenda time-down habit-down urgency-down category-keep)
                                         (todo time-up priority-down category-keep) (tags urgency-down category-keep)
                                         (search category-keep)))
  :bind ("C-c o a" . org-agenda)
  ;; (org-agenda-files
  ;;          (last (sort (org-node-list-files)
  ;;               ((lambda (item) (parse-time-string (apply 'concat (subseq (split-string (file-name-base (car (last (file-name-split item)))) "-") 0 3)))))
  ;;                      ) 10))
  )


(use-package org-agenda-files-track
  :init (defun my/org-agenda-files-track-init ()
          "(Re)initialize dynamic agenda files.

This can take a long time, so it is recommended to run this only
on installation and when first tasks are added to many files via
methods the save hook cannot detect, like file synchronization."
          (interactive)
          ;; ;; uncomment if storing org-agenda-files in file
          ;; (make-empty-file org-agenda-files 'force)
          (org-store-new-agenda-file-list
           (directory-files-recursively
            org-directory (rx ".org" eos) nil
            ;; ignore hidden directories like .git and .attach
            (lambda (subdir)
              (not (eq ?. (string-to-char (file-name-nondirectory subdir)))))))
          ;; use ql here if desired
          (org-agenda-files-track-cleanup-files 'full)
          (message "Initialized agenda files"))
  :config (org-agenda-files-track-mode))


(use-package nano-agenda)
