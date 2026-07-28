(require 'consult-org)

(use-package org
  :bind*
  ("C-c o d" . asdasd-note-org-find-default-notes-file)

  (:map org-capture-mode-map
        ("C-c C-c" . nil)
        ("C-c o c f" . org-capture-finalize)
        )
  :custom
  (org-log-done note)
  (org-todo-keywords
        '((sequence
           "TODO(t)" ; A task that needs doing & is ready to do
           "WAIT(w)"
           "|"
           "DONE(d)" ; Task successfully completed
           "MOVED(m)" ; Task continues in another place
           "CANCEL(c)")))
  (org-default-notes-file "~/notes.org")
  (org-agenda-files (list org-default-notes-file))
  (org-capture-templates
   '(("t" "Task" entry
      (file org-default-notes-file)
      "* TODO %T %?\n \n %(asdasd-note-org-insert-buffer-lang-src-block)\n")
     ("n" "Note" entry
      (file org-default-notes-file)
      "* %T %?\n \n %(asdasd-note-org-insert-buffer-lang-src-block)\n")
     ("l" "Linked note" entry
      (file org-default-notes-file)
      "* %T %?\n \n %a \n %(asdasd-note-org-insert-buffer-lang-src-block)\n"))))

(defun asdasd-note-org-monofile-consult-insert-link (&optional match scope)
  "Insert an Org ID link to a selected Org heading."
  (interactive (unless (derived-mode-p #'org-mode)
                 (user-error "Must be called from an Org buffer")))
  (let ((prefix (not (memq scope '(nil tree region region-start-level file)))))
    (let* ((marker
            (consult--read
             (consult--slow-operation "Collecting headings..."
               (or (consult-org--headings prefix match scope)
                   (user-error "No headings")))
             :prompt "Insert link to heading: "
             :category 'org-heading
             :sort nil
             :require-match t
             :history '(:input consult-org--history)
             :narrow (consult-org--narrow)
             :annotate #'consult-org--annotate
             :group (and prefix #'consult-org--group)
             :lookup (apply-partially #'consult--lookup-prop 'org-marker)))
           (heading
            (save-excursion
              (goto-char marker)
              (org-get-heading t t t t)))
           (id
            (save-excursion
              (goto-char marker)
              (org-id-get-create))))
      (insert (org-link-make-string
               (concat "id:" id)
               heading)))))

(defun my/org-entry-range ()
   (let ((elt (org-element-at-point)))
       (cons (org-element-property :begin elt)
              (org-element-property :end elt))))

(defun my/make-invisible (range)
   (let ((ov (make-overlay (car range) (cdr range))))
      (overlay-put ov 'invisible t)
      (overlay-put ov 'org-hide-done t)
      (overlay-put ov 'evaporate t)))

(defun my/org-hide-done-tasks ()
   (mapc #'my/make-invisible (org-map-entries #'my/org-entry-range "TODO=\"DONE\"|TODO=\"CANCEL\"" 'file)))

(defun my/org-toggle-done-tasks-visibility ()
  "Toggle visibility of DONE tasks in the current buffer."
  (interactive)
  (if (seq-find (lambda (ov) (overlay-get ov 'org-hide-done))
                (overlays-in (point-min) (point-max)))
      ;; If DONE entries are hidden, show them
      (remove-overlays (point-min) (point-max) 'org-hide-done t)
    ;; Otherwise, hide DONE entries
    (my/org-hide-done-tasks)))



(defun asdasd-note-org-insert-buffer-lang-src-block ()
  "Return current buffer major mode as an Org src language string."
  (when (org-capture-get :initial)
    (let* ((buf (org-capture-get :original-buffer))
           (initial (org-capture-get :initial))
           (mode (if (buffer-live-p buf)
                     (buffer-local-value 'major-mode buf)
                   major-mode))
           (src-block-language (or (cdr (assq mode
                                              '((emacs-lisp-mode . "emacs-lisp")
                                                (lisp-interaction-mode . "emacs-lisp")
                                                (python-mode . "python")
                                                (python-ts-mode . "python")
                                                (js-mode . "javascript")
                                                (js-ts-mode . "javascript")
                                                (typescript-mode . "typescript")
                                                (typescript-ts-mode . "typescript")
                                                (c-mode . "c")
                                                (c++-mode . "cpp")
                                                (c++-ts-mode . "cpp")
                                                (sh-mode . "shell")
                                                (bash-ts-mode . "bash")
                                                (org-mode . "org"))))
                                   (replace-regexp-in-string "-mode\\'" "" (symbol-name mode)))
                               ))
      (format "#+begin_src %s \n %s \n #+end_src"
              src-block-language
              initial))))

(defun asdasd-note-org-find-default-notes-file ()
  (interactive)
  (find-file org-default-notes-file))


(defun my/org-src-dir-values ()
  (let (dirs)
    (org-element-map (org-element-parse-buffer) 'src-block
      (lambda (src)
        (when-let* ((params (org-babel-parse-header-arguments
                             (org-element-property :parameters src)))
                    (dir (cdr (assoc :dir params))))
          (push dir dirs))))
    (delete-dups (nreverse dirs))))


(defun asdasd-org-src-dir-read ()
  "completing-read all :dir"
  (interactive)
  (completing-read "Directory: " (my/org-src-dir-values)))

(use-package org-super-agenda)
