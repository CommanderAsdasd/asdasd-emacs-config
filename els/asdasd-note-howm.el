(require 'asdasd-os-win)

;; something like this is already in the 
;; (defun asdasd-note-howm-find-previous-day ()
;;   ""
;;   (interactive)
;;   (let* ((timestamp (parse-time-string (file-name-base (buffer-file-name))))
;;          (yesterday (time-subtract timestamp 86400)))))


(defun asdasd-note-howm-keyword-region ()
  (interactive)
    (howm-keyword-add (list (buffer-substring-no-properties (region-beginning) (region-end)))))

(defun asdasd-note-howm-grep ()
  "grep els dir"
  (interactive)
  (consult-ripgrep howm-directory))

(use-package howm
  :demand t
  :init
  (setq howm-prefix (kbd "C-c ;"))
  (setq howm-view-header-format "\n* [[file:%s]]\n")
  (setq howm-template "* %date %cursor %title \n %file \n")
  :bind*
  ("C-c ; r" . asdasd-note-howm-grep)
  ("C-c ; k a" . howm-keyword-add)
  ;; :bind ("C-c ; ;" . howm-menu)
  
  :custom
  (howm-excluded-file-regexp "\\(^\\|[/\\\\]\\)\\([.]\\|\\(\\.\\(?:git\\|svn\\)\\|CVS\\|RCS\\|_darcs\\)[/\\\\]\\)\\|[~#]$\\|\\.\\(bak\\|elc\\|gz\\|aux\\|toc\\|idx\\|dvi\\)$\\|\\.\\(GIF\\|JP\\(?:E?G\\)\\|P\\(?:BM\\|GM\\|NG\\|PM\\)\\|TIFF?\\|X\\(?:[BP]M\\)\\|gif\\|jp\\(?:e?g\\)\\|p\\(?:bm\\|gm\\|ng\\|pm\\)\\|tiff?\\|x\\(?:[bp]m\\)\\)\\'\\|json\\|?[m]html\\|css\\\|download")
  (howm-search-other-dir (list els))
  (howm-process-coding-system 'utf-8)  
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
  ;; (add-hook 'howm-mode-hook 'org-mode)
  
  (advice-add 'howm-list-recent :after #'howm-view-sort-by-mtime)
  ;; (advice-add 'howm-list-todo :after #'howm-view-sort-by-mtime)
  (advice-add 'howm-list-grep :after #'howm-view-sort-by-mtime)
  (if (asdasd-os-win-wsl-p)
      (setq howm-directory
            (string-replace "~" "/mnt/c/Users/AleksandrTankovskii(/AppData/Roaming" howm-directory)) ;
  ;; (howm-view-title-regexp-grep "^* +")
  ))
  

;; (defun asdasd-note-howm-close-todo ()
;;   ""
;;   (replace-regexp "\\][!|~]" "]." nil (use-region-beginning) (use-region-end) nil (use-region-noncontiguous-p)))

(provide 'asdasd-note-howm)
