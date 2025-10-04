(defcustom asdasd-note-org-node-transclusion-nodes '() "prepared list of transcluded nodes")

(defun asdasd-note-org-node-embark-insert (node)
  (insert (org-link-make-string (concat "id:" id) link-desc)))

(defun asdasd-note-org-node-embark-add-to-transclusion (page)
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

(defun asdasd-note-org-node-add-id-and-tag ()
  "automatically org-id-get-create before org-node-add-tags"
  (interactive)
  (org-id-get-create)
  (call-interactively 'org-node-add-tags))


(defun asdasd-note-org-node-get-tags ()
  "returns all tags"
  (delete-dups
    (nconc (thread-last (append org-tag-persistent-alist
                                org-tag-alist
                                (and org-element-use-cache
                                     (derived-mode-p 'org-mode)
                                     (org-get-buffer-tags)))
                        (mapcar #'car)
                        (cl-remove-if #'keywordp)
                        (mapcar #'substring-no-properties))
           (cl-loop for entry in (org-mem-all-entries)
                    append (org-mem-entry-tags entry)))))


;; useP

(use-package org-mem
  :custom
  (org-mem-do-sync-with-org-id t)
  (org-mem-watch-dirs (list howm-directory))
  (org-mem-roamy-do-overwrite-real-db t)
  (org-roam-db-update-on-save nil)
  :config
  (org-mem-updater-mode)
  (org-mem-roamy-db-mode))

(use-package emacsql)

(defun asdasd-note-org-node-find (initial)
  ""
  (let* ((input (org-node-read-candidate "Visit or create node: " t initial))
         (node (gethash input org-node--candidate<>entry)))
    (org-node--goto node)
    ))

(defun asdasd-note-org-node-find-today ()
  "prefix arg for N days back"
  (interactive)
  (asdasd-note-org-node-find (format-time-string "%y-%m-%d " (time-subtract (current-time) (days-to-time (if current-prefix-arg current-prefix-arg 0))))))

(defun asdasd-note-org-node-find-id ()
  "prefix arg for N days back"
  (interactive)
  (asdasd-note-org-node-find "id-"))

(use-package org-node
  
  :custom
  (org-node-display-sort-fn #'org-node-sort-by-file-mtime)
  (org-node-renames-allowed-dirs (list howm-directory))
  (org-roam-node-default-sort 'file-atime)
  (org-node-seq-defs
   (list
    ;; All notes in creation order, 
    ;; according to the timestamps in their :CREATED: property.
    (org-node-seq-def-on-any-sort-by-property
     "a" "All notes by property :CATEGORY:" "CATEGORY")

    ;; Same as above, but only the nodes that have tag :pub:.
    (org-node-seq-def-on-tags-sort-by-property
     "b" "BWAT" "BWAT" "ID")
    (org-node-seq-def-on-tags-sort-by-property
     "s" "scratch" "scratch" "ID")
    ;; My day-notes, a.k.a. journal/diary.  Currently I still
    ;; structure them like org-roam-dailies expects: confined to a
    ;; subdirectory, with filenames such as "2024-11-18.org".
    ;; This is actually a sequence of files, not sequence of ID-nodes.
    (org-node-seq-def-on-filepath-sort-by-basename
     "d" "Dailies" howm-directory nil t)))
  (org-node-extra-id-dirs (list howm-directory "~/git/"))
  ;; (org-mem-watch-dirs)
  :config (org-node-cache-mode 1)
  (add-hook 'org-node-insert-link-hook 'org-id-get-create)
  (org-node-backlink-mode 1)
  :bind-keymap ("C-c o f" . org-node-global-prefix-map)
  
  :bind
  ("C-c C-S-w" . org-node-refile)
  ("C-c o c" . org-id-get-create)
  ;; ("C-c o f" . org-node-find-prefix-map)
  
  ;; ("C-c o f t" . asdasd-note-org-node-find-today)
  ("C-c o I" . org-node-insert-transclusion)
  ("C-c o i" . org-node-insert-link)
  ("C-c o n i" . asdasd-note-org-node-find-id)
  (:map org-node-global-prefix-map ("t" . asdasd-note-org-node-find-today)
  (:map
   embark-general-map
   ("T" . asdasd-note-org-node-embark-add-to-transclusion)
   ("n i" . asdasd-note-org-node-embark-insert))
  
  (:map org-mode-map
        ("C-c C-c" . org-ctrl-c-ctrl-c)
        ("C-c c" . org-node-add-tags-here))))




(use-package org-node-fakeroam
  :config )




(provide 'asdasd-note-org-node)
