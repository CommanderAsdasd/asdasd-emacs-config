;;; -*- lexical-binding: t; -*-
;; (require 'howm-org)

(require 'asdasd-os-win)
(require 'asdasd-time)
(require 'asdasd-ux-advice)
(require 'asdasd-note-denote)

;; something like this is already in the 
;; (defun asdasd-note-howm-find-previous-day ()
;;   ""
;;   (interactive)
;;   (let* ((timestamp (parse-time-string (file-name-base (buffer-file-name))))
;;          (yesterday (time-subtract timestamp 86400)))))





(defun asdasd-note-howm-extract-heading-to-file ()
  "create fresh file from howm memo note at point"
  (interactive)
  (org-mark-subtree)
  (let ((str (buffer-substring-no-properties (region-beginning) (region-end))))
    (delete-region (region-beginning) (region-end))
    (find-file (asdasd-time-get-date nil (concat "%Y-%m-%d-%H-%M" ".org")))
    (insert str)))


(defun asdasd-note-howm--recursive-files-prompt ()
  (completing-read "howm note: "
                   (directory-files-recursively howm-directory "\.org\\|\.md")
                   nil
                   nil
                   (format "%s" (if (and (sexp-at-point) current-prefix-arg) (sexp-at-point) ""))))

(defun asdasd-vertico-sort-alpha-desc (cands)
    ;; `copy-sequence` keeps Vertico’s internal list untouched
  (nreverse (copy-sequence cands)))

(advice-add 'vertico-sort-alpha :filter-return #'asdasd-vertico-sort-alpha-desc)

(defun asdasd-note-howm-find-file ()
  "find any file under howm-directory"  ;
  (interactive)
  (let ((vertico-sort-override-function 'vertico-sort-alpha))
    (find-file (asdasd-note-howm--recursive-files-prompt))))

(defun asdasd-note-howm-insert-link-on-file ()
  "find any file under howm-directory"
  (interactive)
  (let ((vertico-sort-override-function 'vertico-sort-alpha))
    (insert (org-link-make-string (concat "file:"
                                          (if current-prefix-arg (asdasd-note-howm--recursive-files-prompt-day current-prefix-arg) (asdasd-note-howm--recursive-files-prompt)))) "
")))

(defun asdasd-note-howm--recursive-files-prompt-day (day)
  (completing-read "howm note: " (directory-files-recursively howm-directory "\.org\\|\.md") nil nil (format "\\(%s\\|%s\\)+"
                                                                                                             (asdasd-time-get-date day)
                                                                                                             (asdasd-time-get-date day (car (s-split "T" denote-date-identifier-format))))))

(defun asdasd-note-howm-find-file-today ()
  "prefix arg for N days back"
  (interactive)
  (let ((vertico-sort-override-function 'vertico-sort-alpha))
    (find-file (asdasd-note-howm--recursive-files-prompt-day current-prefix-arg))))


(defun asdasd-note-howm-find-file-id ()
  "find any file under howm-directory"
  (interactive)
  (find-file (completing-read "howm note: " (directory-files-recursively howm-directory "\.org\\|\.md") nil nil "id-")))

(defun asdasd-note-howm-keyword-region ()
  (interactive)
    (howm-keyword-add (list (buffer-substring-no-properties (region-beginning) (region-end)))))

(defun asdasd-note-howm-consult-ripgrep ()
  "grep els dir"
  (interactive)
  (consult-ripgrep (if current-prefix-arg (read-directory-name "howm search in: ") howm-directory) ))

(defun asdasd-note-howm-grep-links-to-current-file ()
  "prefix arg for N days back"
  (interactive)
  (consult-ripgrep howm-directory (concat "file:" (string-replace (getenv "HOME") "~/" buffer-file-name))))

(defun asdasd-note-howm-ripgrep-regexp (regexp-search)
  "grep els dir"
  (interactive "Mripgrep howm-directory: ")
  (ripgrep-regexp regexp-search howm-directory))

(defun asdasd-note-howm-consult-grep-src-blocks ()
  "grep els dir"
  (interactive)
  (let ((consult-ripgrep-args (concat consult-ripgrep-args " -B 1")))
    (consult-ripgrep howm-directory "#+begin_src ")))

(defun asdasd-note-howm-ripgrep-src-blocks ()
  "grep els dir"
  (interactive)
  (lexical-let ((ripgrep-arguments (list "--multiline" "--pcre2")))
    (ripgrep-regexp "(^#\\+name:.*\n#\\+begin_src python" howm-directory ripgrep-arguments)))


(use-package howm
  :demand t
  :init
  (setq howm-prefix (kbd "C-c ;"))
  (define-prefix-command 'asdasd-note-howm-prefix-map)
  :bind*
  ("C-c ; f" . asdasd-note-howm-prefix-map)
  ("C-c ; f f" . asdasd-note-howm-find-file)
  ("C-c ; f t" . asdasd-note-howm-find-file-today)
  ("C-c ; f l" . asdasd-note-howm-insert-link-on-file)
  ("C-c ; k a" . howm-keyword-add)
  ("C-c ; r" . asdasd-note-howm-consult-ripgrep)
  ("C-c ; R" . asdasd-note-howm-ripgrep-regexp)
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
  ;; (howm-template "* %date %cursor \n #+begin_src \n %title \n #+end_src \n %file \n") ; TODO creates src block even if no text selected - clutter
  (howm-template "* %date %cursor %title \n %file \n")
  (howm-template "* %date%cursor %title \n %file \n")
  (howm-time-format "[%Y-%m-%d %H:%M]")
  (howm-reminder-today-format "[%Y-%m-%d %H:%M]")
  
  ;; (howm-dtime-format "<%Y-%m-%d>")  ;; (howm-process-coding-system 'nil)

  ;; [2025-06-09]+ integraion with org-date format
  ;; (howm-template-date-format "<%Y-%m-%d %a %H:%M>")
  
  (howm-template-date-format "[%Y-%m-%d %H:%M]")
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
  (require 'howm-org) ;; Write notes in Org-mode.
  (setq howm-view-header-format "\n* [[file:%s]]\n")
  (add-hook 'howm-create-hook '(lambda () (org-id-get-create)))
  (add-hook 'org-mode-hook 'howm-mode)

  
  (advice-add 'howm-list-recent :after #'howm-view-sort-by-mtime)
  ;; (advice-add 'howm-list-todo :after #'howm-view-sort-by-mtime)
  (advice-add 'howm-list-grep :after #'howm-view-sort-by-mtime)
  (if (asdasd-os-win-wsl-p) (setq howm-directory (string-replace "~" "/mnt/c/Users/asdasd/AppData/Roaming" howm-directory)))
  )
  

;; (defun asdasd-note-howm-close-todo ()
;;   ""
;;   (replace-regexp "\\][!|~]" "]." nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p)))

(provide 'asdasd-note-howm)
