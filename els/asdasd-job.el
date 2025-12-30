;; job-specific helpers
(defun asdasd-job-format-act-app-log ()
  "remove \n and \" in logs"
  (interactive)
  (save-excursion (replace-string "\\n" "
" nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p)))
  (save-excursion (replace-string "\\\"" "\"" nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p))))

(defun asdasd-job-format-act-app-raw-log ()
  (interactive)
  (replace-string "\\\"" "\"" nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p))
  
  (replace-string "\\\\\"" "\\\"" nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p))
  )

;; (defun asdasd-job-find-)

(org-link-set-parameters
    "trace"
    :follow (lambda (id)
              (browse-url
               (format "https://sap.signalfx.com/#/apm/traces/%s" id)))) ; todo TAKE such from local vault


(defun asdasd-job-vscode-find-repo ()
  (interactive)
  (async-shell-command (concat "code " (read-directory-name "repo" "~/repos/")) "*async-shell-command vscode*" "*async-shell-command vscode*"))

(defun asdasd-job-vscode-find-file-at-line ()
  (interactive)
  (async-shell-command (format "code --goto %s:%s" buffer-file-name (line-number-at-pos)) "*async-shell-command vscode*" "*async-shell-command vscode*"))

(defun asdasd-job-region-text ()
  "Return the text in the current region as a string."
  (if (use-region-p)
      (buffer-substring-no-properties (region-beginning) (region-end)
                                      )
    (word-at-point)))

(defun asdasd-job-ripgrep-region-in-issue-management (region)
  (interactive (list (asdasd-job-region-text)))
  (ripgrep-regexp region "~/repos/act-issue-management/"))



(defun find-file-with-line (filepath-line)
  "Open FILEPATH-LINE where FILEPATH-LINE is in the format `/path/to/file:linenum`."
  (let* ((parts (split-string filepath-line ":"))
         (file (car parts))
         (line (string-to-number (cadr parts))))
    (find-file-other-window file)
    (when (and (numberp line) (> line 0))
      (goto-line line)))
  )

(defun asdasd-job-goto-relative-file ()
  (interactive)
  (find-file-with-line (expand-file-name (thing-at-point 'filename t) "~/repos/act-issue-management/")))

(defun asdasd-job-vscode-find-relative-file ()
  (interactive)
  (asdasd-job-goto-relative-file)
  (other-window 1))

(defun asdasd-job-get-which-function ()
  (interactive)
  (save-excursion
    (asdasd-job-goto-relative-file)
    (kill-new (which-function))))

(defun asdasd-job-chunk-edit-defun-in-relative-file ()
  (interactive)
  (save-excursion
    (asdasd-job-goto-relative-file)
    (mark-defun)
    (chunk-edit)))

(use-package emacs
  :bind*
  ("C-c j r" . asdasd-job-ripgrep-region-in-issue-management)
  ("C-c j g" . asdasd-job-goto-relative-file)
  ("C-c j f" . asdasd-job-get-which-function)
  ("C-c j v l" . asdasd-job-vscode-find-file-at-line))