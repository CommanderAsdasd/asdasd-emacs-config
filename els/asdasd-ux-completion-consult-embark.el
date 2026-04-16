(require 'asdasd-emacs-api)
(require 'asdasd-os-path)
(require 'asdasd-ux-media)


;; (defun asdasd-embark-)

(defun asdasd-embark-setq-local (variable)
  "set local value for VARIABLE"(
                                 (make-variable-buffer-local (intern variable)))
  (set-variable
   variable
   (read-string "set local value: " variable)))

(defun asdasd-embark-org-node-read-tags (node)
  "read from list of tags")


(defun asdasd-embark-edebug-instrument-function (function)
  ""
  (edebug-instrument-function (intern (substring-no-properties function)))
  )

(defun asdasd-embark-edebug-eval-expression (candidate)
  ""
  (message (edebug-eval (intern (substring-no-properties candidate))))
  )

;; (defvar asdasd-embark-org-node--tags-list () "docstring")

(defun asdasd-embark-org-node-add-tag (&optional node)
  ""
  ;; (interactive)
  
  (save-excursion
    (org-node--goto (gethash node org-node--candidate<>node))
    ;; (if asdasd-embark-org-node--tags-list)
    (org-node-tag-add-here (org-node--read-tags))))
  

;; (defun asdasd-embark-ffmepg-convert-to-mp3 (object)
;;   "object at point to mp3"
;;   (interactive "P")
;;   (start-process-shell-command "ffmpeg" (concat "*" (compile-time-function-name) "*")  (format "-i %s -o %s.mp3" (object))))
  
(defun asdasd-embark-org-copy-heading-as-kill ()
  "Copy org heading text without the leading stars into the kill ring.
Works like `embark-copy-as-kill' but cleans the heading first."
  (interactive)
  (let ((heading (org-get-heading t t t t)))
    (kill-new heading)
    (message "Copied heading: %s" heading)))


(defun asdasd-embark-everything (candidate)
  "search with consult-everything CANDIDATE"
  (consult-everything candidate)
  )

(defun asdasd-embark-os-file-manager-here (file)
  "executes windows file manager command for FILE"
  (let* ((truename (file-truename file))
         (path (string-replace " " "^ " (replace-regexp-in-string "/" "\\\\" truename)))
         ;; (command (concat (format "set P=\"%s\"" path) "^
;; "
         ;;                           "explorer.exe /select,\"%P%\""))
         (command (format "explorer.exe /select,%s\"" path) )
         (shell-file-name "cmd.exe")
        (shell-command-switch "/c"))
    (kill-new command)
    (start-process-shell-command "explorer" "explorer" command)
    ))

(defun asdasd-embark-save-full-path (file)
  "like embark-save-relative-path"
  (kill-new (file-truename (substitute-in-file-name file)))
  )
  (defun asdasd-embark-buffer-file-name (buffer-name)
    ""
    (kill-new (buffer-file-name (get-buffer buffer-name))))
  
  (defun asdasd-embark-buffer-file-name-directory (buffer-name)
    ""
    (kill-new (file-name-directory (buffer-file-name (get-buffer buffer-name)))))


(use-package embark
  :custom (embark-quit-after-action nil)
  :bind*
  ("M-." . embark-act)
  ("M-," . embark-dwim)
  ("C-h B" . embark-bindings)
  (:map embark-file-map
        ("W" . asdasd-embark-save-full-path)
        ("Q" . asdasd-embark-os-file-manager-here)
        (";" . asdasd-embark-ffmepg-convert-to-mp3)
        
        ;; ("p" . asdasd-ux-media-embark-add-to-vlc-playlist)
        ("\"" . asdasd-ux-media-embark-ffmpeg-convert))
  (:map embark-region-map
        ("z" . asdasd-embark-everything)
        ("Q" . asdasd-embark-os-file-manager-here)
        ("p" . asdasd-ux-media-embark-add-to-vlc-playlist)
        ("\"" . asdasd-ux-media-embark-ffmpeg-convert)
        ("p" . system-packages-install)
        ("P" . system-packages-uninstall))
  (:map embark-buffer-map
        ("f" . asdasd-embark-buffer-file-name)
        ("d" . asdasd-embark-buffer-file-name-directory))
  (:map embark-symbol-map
        ("l" .  asdasd-embark-setq-local)
        ("Q" . asdasd-embark-edebug-eval-expression))
  (:map embark-identifier-map
        ("p" . system-packages-install)
        ("P" . system-packages-uninstall))
  (:map embark-package-map
        ("i" . embark-insert)
        ("I" . package-install))
  (:map embark-general-map
        ("t" . asdasd-embark-org-node-add-tag)
        ("T" . asdasd-note-org-node-embark-add-to-transclusion)
        ("n i" . asdasd-note-org-node-embark-insert))
  (:map embark-function-map
        ("D" . asdasd-embark-edebug-instrument-function)
        ("Q" . asdasd-embark-edebug-eval-expression))
  (:map embark-org-heading-map
        ("*" . asdasd-embark-org-copy-heading-as-kill)))






(use-package embark-consult)

(provide 'asdasd-ux-completion-consult-embark)
