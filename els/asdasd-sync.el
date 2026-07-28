(require 'asdasd-code-elisp-function-name)


;; sync emacses across diff platforms

(defcustom asdasd-sync-local-config-dir "/ctxmnt/C5405944@GLOBAL.CORP.SAP/default/C/Users/AleksandrTankovskii(/.emacs.d/" "backup emacs dir on local pc")
(defcustom asdasd-sync-vdi-config-dir "~/.emacs.d" "emacs dir on vdi")
(defcustom asdasd-sync-local-config-dir-ediff "~/.emacs.d.local" "dir of original local machine config")


;; clipboard VDI sync in Sanofo




;; VDI legacy
;; TODO deprecate it to the storage

(defun asdasd-sync-local-to-vdi ()
  (interactive)
  (async-shell-command (format "rsync -ravz --checksum -av %s %s" (shell-quote-argument asdasd-sync-local-config-dir) (shell-quote-argument asdasd-sync-vdi-config-dir)) (format "*%s*" (compile-time-function-name)) (format "*%s*" (compile-time-function-name))))

(defun asdasd-sync-vdi-to-local ()
  (interactive)
  (async-shell-command (format "rsync -ravz --checksum -av %s %s" (shell-quote-argument (file-truename asdasd-sync-vdi-config-dir)) (shell-quote-argument asdasd-sync-local-config-dir)) (format "*%s*" (compile-time-function-name)) (format "*%s*" (compile-time-function-name))))

;; WSL git workaround
;; TODO fix ssh keys for win

(defun asdasd-sync-wsl-emacs-d-push (&optional process-name buffer-name)
  (interactive)
  (let* ((process-name (if process-name process-name (format "*%s*" (compile-time-function-name))))
        (buffer-name process-name))
    (start-process-shell-command process-name buffer-name "wsl -e bash -c \"cd /home/leksandrankovskii/.emacs.d; git push --set-upstream origin autowork\"")))


(defun asdasd-sync-wsl-emacs-d-fetch ()
  (interactive)
  (let ((process-name (format "*%s*" (compile-time-function-name)))
        (buffer-name process-name))
    (start-process-shell-command process-name buffer-name "wsl -e bash -c \"cd /home/leksandrankovskii/.emacs.d; git fetch\"" "*wsl-push*" "*wsl-push*")))

(defun asdasd-sync-magit-ediff-compare-current-file ()
  (interactive)
  (magit-ediff-compare "linux-work-vdi" nil buffer-file-truename buffer-file-truename))

;; merging tools

(defun asdasd-sync-ediff-compare-with-local-config ()
  "simple comparer of same config file between config instances"
  (interactive)
  (let ((path-from-config-dir-root (replace-regexp-in-string ".*emacs\.d.*?/" "" (buffer-file-name))))
    (ediff-files buffer-file-name (expand-file-name path-from-config-dir-root asdasd-sync-local-config-dir-ediff))))

;; commit by timer

(defun asdasd-sync-commit-config ()
  ""
  (interactive)
  (let* ((default-directory user-emacs-directory)
         (process-name (format "*%s*" (compile-time-function-name)))
         (buffer-name process-name))
    
    (start-process-shell-command process-name buffer-name "git add .")
    (start-process-shell-command process-name buffer-name (format "git commit -m \"%s\"" (asdasd-time-get-date nil "%Y-%m-%d-%H%M%S autocommit"))))
  ;; (asdasd-sync-wsl-emacs-d-push)
  ;; (asdasd-sync-wsl-emacs-d-fetch)
  )


(provide 'asdasd-sync)
