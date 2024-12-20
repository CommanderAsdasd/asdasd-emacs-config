(use-package emacs
  :custom ((backup-directory-alist '(("." . "~/MyEmacsBackups")))
           
           (auto-save-visited-mode t)))


(use-package savehist
  :config (savehist-mode 1)
  (setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring org-capture--prompt-history)))

(defun xah-save-all-unsaved ()
  "Save all unsaved files. no ask. Version 2019-11-05"
  (interactive)
  (save-some-buffers t))

(if (version< emacs-version "27")
    (add-hook 'focus-out-hook 'xah-save-all-unsaved)
  (setq after-focus-change-function 'xah-save-all-unsaved))

;; (defun my-buffer-focus-out-function ()
;;   (when (and (buffer-file-name) (buffer-modified-p))
;;     (save-buffer)
;;   (message "Buffer focus out")))

;; (add-hook 'buffer-list-update-hook 'my-buffer-focus-out-function)

(use-package recentf
  :config (recentf-mode))


(use-package backup-walker
  :custom (backup-each-save-remote-files t) )


;; (load "i:/git/emacs-visualizations/delete-all-backups.el")
