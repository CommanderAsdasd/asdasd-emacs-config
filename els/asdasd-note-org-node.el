(defcustom asdasd-note-org-node-transclusion-nodes '() "prepared list of transcluded nodes")

(defun asdasd-note-org-node-add-to-transclusion (page)
  "add PAGE marked in embark to transclusion list"
  ;; (interactive "P")
  (push page asdasd-note-org-node-transclusion-nodes))

(defun asdasd-note-org-node-transclude-pages-temp-buffer ()
  "create temp buffer with nodes transcluded from asdasd-note-org-node-transclusion-nodes"
  ;; (interactive (list (org-node-read)))
  (with-current-buffer (get-buffer-create ;; (format "*transclusions: %s" (org-node-get-title (if (string= (type-of nodes) 'cons) (car nodes) nodes)))
                                          (format "*transclusions: %s" (org-node-get-title car asdasd-note-org-node-transclusion-nodes)))
    (org-mode)
    (mapc 'org-node-insert-transclusion asdasd-note-org-node-transclusion-nodes)))





(use-package org-mem
  :custom
  (org-mem-do-sync-with-org-id t)
  (org-mem-watch-dirs (list howm-directory))
  
  :config
  (org-mem-updater-mode)
  (org-mem-roamy-db-mode))

(use-package org-node
  :custom
  (org-node-renames-allowed-dirs (list howm-directory))
  (org-node-seq-defs
      (list
       ;; All notes in creation order, 
       ;; according to the timestamps in their :CREATED: property.
       (org-node-seq-def-on-any-sort-by-property
        "a" "All notes by property :CREATED:" "CREATED")

       ;; Same as above, but only the nodes that have tag :pub:.
       (org-node-seq-def-on-tags-sort-by-property
        "w" "Ematiq" "ematiq" "")

       ;; My day-notes, a.k.a. journal/diary.  Currently I still
       ;; structure them like org-roam-dailies expects: confined to a
       ;; subdirectory, with filenames such as "2024-11-18.org".
       ;; This is actually a sequence of files, not sequence of ID-nodes.
       (org-node-seq-def-on-filepath-sort-by-basename
        "d" "Dailies" "~/org/daily/" nil t)))
  
  ;; (org-node-extra-id-dirs howm-directory)
  ;; (org-mem-watch-dirs)
  :config (org-node-cache-mode 1)
  
  (add-hook 'org-node-insert-link-hook #'newline)
  (add-hook 'howm-after-save-hook 'org-node-rename-file-by-title)
  (org-node-backlink-mode 1)
  :bind (("C-c C-S-w" . org-node-refile)
         ("C-c o c" . org-id-get-create)
  ("C-c o f" . org-node-find)
  ("C-c o I" . org-node-insert-transclusion)
  ("C-c o i" . org-node-insert-link)
  :map
  embark-general-map
  ("T" . asdasd-note-org-node-add-to-transclusion)
  :map org-mode-map ("C-c C-c" . org-ctrl-c-ctrl-c)
  ("C-c c" . org-node-add-tags))
  )

(use-package org-roam-ui
  :custom (org-roam-directory howm-directory))

(provide 'asdasd-note-org-node)
