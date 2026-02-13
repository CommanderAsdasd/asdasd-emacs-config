(use-package emacs
  :custom (backup-directory-alist '(("." . "~/MyEmacsBackups/")))
           (auto-save-visited-mode t)
           (auto-save-file-name-transforms
            `((".*" "~/MyEmacsBackups/" t)))
           (kept-new-versions 10)
           (kept-old-versions 10)
           (version-control t))

;; (use-package backup)

(defvar save-all-unsaved-mutex nil "stop save-some-buffers from reinvoking")
(defun asd-save-all-unsaved ()
  "Save all unsaved files. no ask. Version 30.09.25"
  (interactive)
  (unless save-all-unsaved-mutex
    (setq save-all-unsaved-mutex t)
    (save-some-buffers t)
    (savehist-save))
  (setq save-all-unsaved-mutex nil))


(if (version< emacs-version "27")
    (add-hook 'focus-out-hook 'asd-save-all-unsaved)
  (setq after-focus-change-function 'asd-save-all-unsaved))


;; (defun my-buffer-focus-out-function ()
;;   (when (and (buffer-file-name) (buffer-modified-p))
;;     (save-buffer)
;;   (message "Buffer focus out")))

;; (add-hook 'buffer-list-update-hook 'my-buffer-focus-out-function)

(use-package vc-backup
  :config )

(use-package backup-walker
  :custom (backup-each-save-remote-files t))


;; (load "i:/git/emacs-visualizations/delete-all-backups.el")
