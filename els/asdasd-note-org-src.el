;; storage of block name
(defvar org-src-edit--block-name '() "store last edited block")

;; advice to org-edit-src-code - save block name to storage
(defun org-src-edit-store-block-name ()
  "docstring"
  (setq org-src-edit--block-name (org-element-property :name (org-element-at-point))))

;; hook to org-src-mode-hook - rename and delete temp val
(defun org-src-edit-rename-buffer-code-block-name ()
  "Rename Org src edit buffer to use code block name"
 
  (when org-src-edit--block-name
    (rename-buffer (format "*Org Src Edit: %s*" org-src-edit--block-name))
    (setq org-src-edit--block-name '())))


(advice-add 'org-edit-src-code :before 'org-src-edit-store-block-name)
(add-hook 'org-src-mode-hook #'org-src-edit-rename-buffer-code-block-name)
