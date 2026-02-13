(require 'asdasd-os-win)
(require 'asdasd-time)
(require 'asdasd-ux-advice)

;; something like this is already in the 
;; (defun asdasd-note-howm-find-previous-day ()
;;   ""
;;   (interactive)
;;   (let* ((timestamp (parse-time-string (file-name-base (buffer-file-name))))
;;          (yesterday (time-subtract timestamp 86400)))))

(defun asdasd-note-howm--list-note-files-in-dir (dir)
  "returns list of files in DIR with find"
  (let ((default-directory dir))
    (split-string (shell-command-to-string "find ./ -type f  \\( -name '*.org' -o -name '*.md' \\)  -printf \"%p\n\"") "\n" t)))

(defun asdasd-note-howm--recursive-files-prompt ()
  (completing-read "howm note: "
                   (directory-files-recursively howm-directory "\.org\\|\.md")
                   nil
                   nil
                   (format "%s" (if (and (sexp-at-point) current-prefix-arg) (sexp-at-point) ""))))

(defun asdasd-note-howm--recursive-files-prompt-quick ()
  "find util workaround for slow fs"
  (completing-read "howm note: "
                   ;; (directory-files-recursively howm-directory "\.org\\|\.md")
                   (asdasd-note-howm--list-note-files-in-dir default-directory)
                   nil
                   nil
                   (format "%s" (if (and (sexp-at-point) current-prefix-arg) (sexp-at-point) ""))))

(defun asdasd-note-howm-find-file ()
  "find any file under howm-directory"
  (interactive)
  (let ((vertico-sort-function 'vertico-sort-alpha))
    (find-file (asdasd-note-howm--recursive-files-prompt))))

(defun asdasd-note-howm-insert-link-on-file ()
  "find any file under howm-directory"
  (interactive)
  (let ((vertico-sort-function 'vertico-sort-alpha))
    (insert (org-link-make-string (concat "file:"
                                          (if current-prefix-arg (asdasd-note-howm--recursive-files-prompt-day current-prefix-arg) (asdasd-note-howm--recursive-files-prompt)))) "
")))

(defun asdasd-note-howm--recursive-files-prompt-day (day)
  "pre-fills howm-directory recursive prompt with ARG is num of DAY before today"
  (completing-read "howm note: " (directory-files-recursively howm-directory "\.org\\|\.md") nil nil (asdasd-time-get-date day)))

(defun asdasd-note-howm--recursive-files-prompt-day-quick (day &optional time-string)
  "reduces directory-files-recursively to the month of chosen day"
  (let ((time-string (if time-string time-string "%Y-%m-%d")))
    (completing-read "howm note: "
                   (asdasd-note-howm--list-note-files-in-dir (expand-file-name (asdasd-time-get-date day "%Y/%m") howm-directory))
                   ;; (directory-files-recursively (expand-file-name (asdasd-time-get-date day "%Y/%m") howm-directory) "\.org\\|\.md")
                   nil nil (format "%s " (asdasd-time-get-date day time-string)))))

(defun asdasd-note-howm-find-file-today ()
  "prefix arg for N days back"
  (interactive)
  (let ((vertico-sort-function 'vertico-sort-alpha))
    (find-file (asdasd-note-howm--recursive-files-prompt-day current-prefix-arg))))

(defun asdasd-note-howm-find-file-this-month ()
  "prefix arg for N days back"
  (interactive)
  (let* ((vertico-sort-function 'vertico-sort-alpha)
        (day current-prefix-arg)
        (default-directory (expand-file-name (asdasd-time-get-date day "%Y/%m") howm-directory)))
    (find-file (asdasd-note-howm--recursive-files-prompt-day-quick day "%Y-%m"))))

(defun asdasd-note-howm-find-file-id ()
  "find any file under howm-directory"
  (interactive)
  (find-file (completing-read "howm note: " (directory-files-recursively howm-directory "\.org\\|\.md") nil nil "id-")))

(defun asdasd-note-howm-keyword-region ()
  (interactive)
    (howm-keyword-add (list (buffer-substring-no-properties (region-beginning) (region-end)))))

(defun asdasd-note-howm-grep ()
  "grep els dir"
  (interactive)
  (consult-ripgrep (if current-prefix-arg (read-directory-name "howm search in: ") howm-directory) ))

(defun asdasd-note-howm-grep-links-to-current-file ()
  "prefix arg for N days back"
  (interactive)
  (consult-ripgrep howm-directory (concat "file:"
                                          (if (string= (getenv "HOST") "AZRWEU041027")
                                              (string-replace "/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(/" "~/" buffer-file-name)
                                              (string-replace (getenv "HOME") "~/" buffer-file-name)))))

(defun asdasd-note-howm-consult-grep-src-blocks ()
  "grep els dir"
  (interactive)
  (let ((consult-ripgrep-args (concat consult-ripgrep-args " -B 1")))
    (consult-ripgrep howm-directory "#+begin_src ")))

(defun asdasd-note-howm-ripgrep-src-blocks ()
  "grep els dir"
  (interactive)
  (let ((ripgrep-arguments '("--multiline" "--pcre2")))
    (ripgrep-regexp "(?s)^#\\+name:.*\n#\\+begin_src python" default-directory "*.org")))

(defun asdasd-note-howm-grep-buffer-file-links ()
  "grep els dir"
  (interactive)
  (consult-ripgrep (if current-prefix-arg (read-directory-name "howm search in: ") howm-directory) (file-name-nondirectory (buffer-file-name))))

(defun asdasd-note-howm-unify-path ()
  "string replacements to unify HOWM file paths across envs"
  (interactive)
  (save-excursion
    (beginning-of-buffer)
  (replace-string "file:/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(" "file:~")))


(setq howm-template "* %date %cursor %title \n %file \n")

(use-package howm
  :demand t
  :init
  (setq howm-prefix (kbd "C-c ;"))
  (setq howm-view-header-format "\n* [[file:%s]]\n*")
  (setq howm-template "* %date %cursor %title \n %file \n")
  (define-prefix-command 'asdasd-note-howm-prefix-map)
  ;; (define-prefix-command 'asdasd-note-howm-prefix)
  ;; (global-set-key (kbd "C-c ; f") 'asdasd-note-howm-prefix)
  :bind*
  ("C-c ; f" . asdasd-note-howm-prefix-map)
  ("C-c ; f f" . asdasd-note-howm-find-file)
  ("C-c ; f t" . asdasd-note-howm-find-file-today)
  ("C-c ; f i" . asdasd-note-howm-insert-link-on-file)
  ;; ( . asdasd-note-howm-find-file-id)
  ("C-c ; r" . asdasd-note-howm-grep)
  ("C-c ; R" . asdasd-note-howm-grep-links-to-current-file)
  ("C-c ; k a" . howm-keyword-add)


  ;; :bind ("C-c ; ;" . howm-menu)
  
  :custom
  (howm-date-format "%Y-%m-%d %H:%M")
  (howm-reminder-today-format "[%Y-%m-%d %H:%M]")
  (howm-keyword-file (expand-file-name ".howm-keys" howm-directory))
  (howm-excluded-file-regexp "\\(^\\|[/\\\\]\\)\\([.]\\|\\(\\.\\(?:git\\|svn\\)\\|CVS\\|RCS\\|_darcs\\)[/\\\\]\\)\\|[~#]$\\|\\.\\(bak\\|elc\\|gz\\|aux\\|toc\\|idx\\|dvi\\)$\\|\\.\\(GIF\\|JP\\(?:E?G\\)\\|P\\(?:BM\\|GM\\|NG\\|PM\\)\\|TIFF?\\|X\\(?:[BP]M\\)\\|gif\\|jp\\(?:e?g\\)\\|p\\(?:bm\\|gm\\|ng\\|pm\\)\\|tiff?\\|x\\(?:[bp]m\\)\\)\\'\\|json\\|?[m]html\\|css\\\|download")
  (howm-search-other-dir (list els))
  (howm-process-coding-system 'utf-8-dos)  
  (howm-view-header-regexp "^* .*$")
  (howm-view-title-header "*")
  (howm-view-title-regexp "^*\\( +\\(.*\\)\\|\\)$")
  (howm-file-name-format "%Y/%m/%Y-%m-%d-%H%M%S.org")
  (howm-date-format "%Y-%m-%d %H:%M")
  ;; (howm-template "* %date %cursor \n #+begin_src \n %title \n #+end_src \n %file \n") ; TODO creates src block even if no text selected - clutter
  
  ;; (howm-time-format "<%Y-%m-%d %H:%M>")
  
  ;; (howm-dtime-format "<%Y-%m-%d>")  ;; (howm-process-coding-system 'nil)

  ;; [2025-06-09]+ integraion with org-date format
  ;; (howm-template-date-format "<%Y-%m-%d %a %H:%M>")
  
  ;; (howm-template-date-format "[%Y-%m-%d %a %H:%M]")
  ;; `(howm-view-title-regexp ,(format "^%s\\( +\\(.*\\)\\|\\)$" howm-view-title-header))
  ;; (howm-keyword-format ":%s:")
  ;; (howm-keyword-header "<<<")
  (howm-template-file-format "[[file:%s]]")
  ;; (howm-view-use-grep t)
  (howm-view-use-grep t)
  (howm-view-grep-command "rg")
  (howm-view-grep-option "-nH --no-heading --color never")
  (howm-view-grep-extended-option nil)
  (howm-view-grep-fixed-option "-F")
  (howm-view-grep-expr-option nil)
  (howm-view-grep-file-stdin-option nil)
  (howm-view-summary-name "*howmS %s*")
  ;; (howm-menu-recent-regexp "\\*")
  ;; (howm-dtime-format "<%Y-%m-%d %a %H:%M>")
  ;; (howm-menu-recent-regexp "^*[.*] \\( +\\(.*\\)\\|\\)$")
  ;; (howm-menu-recent-regexp "^*[.*] \\( +\\(.*\\)\\|\\)$")
  :config
  
  (add-hook 'howm-create-hook '(lambda () (org-id-get-create)))
  (add-hook 'org-mode-hook 'howm-mode)
  (add-hook 'howm-after-save-hook 'org-node-rename-file-by-title)
  (add-hook 'howm-after-save-hook 'asdasd-note-howm-unify-path)
  ;; (add-hook 'howm-mode-hook 'org-mode)
  
  (advice-add 'howm-list-recent :after #'howm-view-sort-by-mtime)
  ;; (advice-add 'howm-list-todo :after #'howm-view-sort-by-mtime)
  (advice-add 'howm-list-grep :after #'howm-view-sort-by-mtime)
  (if (asdasd-os-win-wsl-p)
      (setq howm-directory
            (string-replace "~" "/mnt/c/Users/AleksandrTankovskii(/AppData/Roaming" howm-directory)) ;
  ;; (howm-view-title-regexp-grep "^* +")
    )
  (advice-add 'asdasd-note-howm-find-file-today :before #'asdasd-ux-advice-vertico-sort-alpha))




;; (defun asdasd-note-howm-close-todo ()
;;   ""
;;   (replace-regexp "\\][!|~]" "]." nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p)))

(provide 'asdasd-note-howm)
