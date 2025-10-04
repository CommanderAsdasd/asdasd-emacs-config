;; rename-visited-file
;; (defun asdasd-rename-current-buffer-file ()
;;   "renames the file associated with the current buffer."
;;   (interactive)
;;   (let* ((old-name (buffer-file-name))
;;          (new-name (read-file-name "new name: " nil old-name)))
;;     (when (not (equal old-name new-name))
;;       (rename-file old-name new-name t)
;;       (set-visited-file-name new-name t t))))

;; dired-do-rename
;; (defun asdasd-dired-move-marked-files ()
;;   "Move marked files to a pre-defined directory."
;;   (interactive)
;;   (let ((files (dired-get-marked-files)))
;;     (dired-do-shell-command
;;      (concat "mv -t /path/to/destination " (mapconcat 'identity files " "))
;;      nil
;;      files)))


;; (defun asdasd-ux-files-)

(use-package find-file
  :bind ("C-x C-z" . find-file)
  :custom (buffer-save-without-query))

(use-package emacs
  :preface (require 'dired)
  :bind 
  ("C-c p f" . find-file-at-point)
  (:map dired-mode-map ("C-c C-m" . my-dired-open-marked-files))
  :custom (save-buffer-coding-system 'utf-8)
  :config
  
  (add-to-list 'completion-at-point-functions 'comint-dynamic-complete-filename))

(defun asdasd-dired-open-marked-files ()
  "Open marked files with Windows Explorer."
  (interactive)
  (let ((files (dired-get-marked-files)))
    (mapc (lambda (file)
            (start-process "explorer" nil "explorer" file))
          files)))

(defun asdasd-delete-file-kill-buffer ()
  ""
  (interactive)
  (when (yes-or-no-p "delete file kill buffer? ")
    (delete-file buffer-file-name)
    (kill-buffer)))




(defun asdasd-ux-files-rename-append-kill-ring-contents ()
  "rename to file-name-base + car kill-ring + .extension"
  (interactive)
  (rename-visited-file (concat (file-name-base (buffer-file-name)) (car kill-ring)  (url-file-extension (buffer-file-name)))))

(defun asdasd-ux-files-write-rename-append-kill-ring-contents ()
  "write-file next to file with name file-name-base + car kill-ring + .extension"
  (interactive)
  (write-file (concat (file-name-base (buffer-file-name)) "_" (car kill-ring)  "_" (url-file-extension (buffer-file-name)))))
