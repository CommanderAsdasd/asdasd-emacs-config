(require 'org)
(require 'org-element)
(require 'ob-core)
(require 'ediff)

(defun org--get-src-code-by-name (name)
  "Return (LANG . CODE) for the src block named NAME, or nil if not found."
  (save-excursion
    (org-babel-goto-named-src-block name)
      (let* ((el (org-element-context))
             (lang (org-element-property :language el))
             (code (org-element-property :value el)))
        (cons lang code))))

(defun org-diff-src-blocks (name1 name2)
  "Diff two org-babel src blocks by NAME1 and NAME2 using Ediff."
  (interactive
   (let* ((names (org-element-map (org-element-parse-buffer) 'src-block
                   (lambda (el) (org-element-property :name el))))
          (n1 (completing-read "First block name: " names nil t))
          (n2 (completing-read "Second block name: " names nil t)))
     (list n1 n2)))
  (unless (and (stringp name1) (stringp name2))
    (user-error "Provide two block names"))
  (let* ((b1 (org--get-src-code-by-name name1))
         (b2 (org--get-src-code-by-name name2)))
    (unless b1 (user-error "No src block named %s" name1))
    (unless b2 (user-error "No src block named %s" name2))
    (let* ((buf1 (generate-new-buffer (format "*org-diff:%s*" name1)))
           (buf2 (generate-new-buffer (format "*org-diff:%s*" name2)))
           (lang1 (car b1)) (code1 (cdr b1))
           (lang2 (car b2)) (code2 (cdr b2)))
      (with-current-buffer buf1
        (insert code1)
        (when (and lang1 (fboundp (intern (concat (downcase lang1) "-mode"))))
          (funcall (intern (concat (downcase lang1) "-mode")))))
      (with-current-buffer buf2
        (insert code2)
        (when (and lang2 (fboundp (intern (concat (downcase lang2) "-mode"))))
          (funcall (intern (concat (downcase lang2) "-mode")))))
      (ediff-buffers buf1 buf2))))

(provide 'asdasd-note-org-src-diff)
