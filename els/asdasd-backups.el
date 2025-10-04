(use-package emacs
  :custom ((backup-directory-alist '(("." . "~/MyEmacsBackups/")))
           (auto-save-visited-mode t)
           (auto-save-file-name-transforms
                 `((".*" "~/MyEmacsBackups/" t)))))
  
(defun xah-save-all-unsaved ()
  "Save all unsaved files. no ask. Version 2019-11-05"
  (interactive)
  (save-some-buffers t)                 ;
  (savehist-save)
  ;; (bookmark-save)
  
  )

(if (version< emacs-version "27")
    (add-hook 'focus-out-hook 'xah-save-all-unsaved)
  (setq after-focus-change-function 'xah-save-all-unsaved)
  )


;; (defun my-buffer-focus-out-function ()
;;   (when (and (buffer-file-name) (buffer-modified-p))
;;     (save-buffer)
;;   (message "Buffer focus out")))

;; (add-hook 'buffer-list-update-hook 'my-buffer-focus-out-function)

(use-package backup-walker
  :custom (backup-each-save-remote-files t))

(use-package backup-each-save)

(use-package files
  :straight nil
  :custom (version-control t)
(delete-old-versions t)
(dired-kept-versions 10)
(kept-new-versions 10)
(kept-old-versions 10))


(use-package vc-backup)
;; (load "i:/git/emacs-visualizations/delete-all-backups.el")
