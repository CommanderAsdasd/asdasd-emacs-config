(defun asdasd-embark-print-candidate (candidate)
  "debug print embark candidate"
  (message "%s %s" candidate))

(defun asdasd-embark-config-load (candidate)
  "load file where candidate found"
  (load-fil)
  )

(defun asdasd-embark-setq-local (variable)
    "set local value for VARIABLE"(
    (make-variable-buffer-local (intern variable)))
    (set-variable
     variable
     (read-string "set local value: " variable)))

(defun asdasd-embark-org-node-read-tags (node)
  "read from list of tags"  
  )

(defun asdasd-embark-replace (object)
  ""
  (interactive "")
  )

;; (defvar asdasd-embark-org-node--tags-list () "docstring")

(defun asdasd-embark-org-node-add-tag (&optional node)
  ""
  ;; (interactive)
  
  (save-excursion
    (org-node--goto (gethash node org-node--candidate<>node))
    ;; (if asdasd-embark-org-node--tags-list)
    (org-node-tag-add-here (org-node--read-tags))))


  
(defun asdasd-embark-org-copy-heading-as-kill ()
  "Copy org heading text without the leading stars into the kill ring.
Works like `embark-copy-as-kill' but cleans the heading first."
  (interactive)
  (let ((heading (org-get-heading t t t t)))
    (kill-new heading)
    (message "Copied heading: %s" heading)))



(defun asdasd-embark-os-file-manager-here (file)
  "executes windows file manager command for FILE"
  (let ((truename (file-truename file)))
    (kill-new truename)
    (start-process-shell-command "explorer"  nil (format "explorer /select,\"%s\"" (replace-regexp-in-string "/" "\\\\" truename)))))

  
  
  (defun asdasd-embark-buffer-file-name (buffer-name)
    ""
    (kill-new (buffer-file-name (get-buffer buffer-name))))
  
  (defun asdasd-embark-buffer-file-name-directory (buffer-name)
    ""
    (kill-new (file-name-directory (buffer-file-name (get-buffer buffer-name)))))

(use-package embark
  :custom
  (embark-confirm-act-all nil)
  (embark-quit-after-action nil)
  
  :bind
  ("C-." . embark-act)
  ("C-," . embark-dwim)
  ("C-h B" . embark-bindings)
  (:map embark-org-heading-map
  ("*" . asdasd-embark-org-copy-heading-as-kill))
  
  ;; :map embark-consult-async-search-map
  
  (:map embark-file-map
  ("Q" . asdasd-embark-os-file-manager-here))
  (:map embark-buffer-map
  ("f" . asdasd-embark-buffer-file-name)
  ("d" . asdasd-embark-buffer-file-name-directory))
  (:map embark-symbol-map
  ("l" .  asdasd-embark-setq-local))
  (:map embark-package-map
  ("i" . embark-insert)
  ("I" . package-install))
  (:map embark-general-map
  ("t" . asdasd-embark-org-node-add-tag)
  ("p" . asdasd-embark-print-candidate)))




(use-package embark-consult)

(provide 'asdasd-ux-completion-consult-embark)
