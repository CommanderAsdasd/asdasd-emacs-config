(use-package no-littering
  :init
  (setq no-littering-etc-directory "~/.cache/emacs")
  (setq no-littering-var-directory "~/.emacs.d/")
  :custom
  (custom-file (expand-file-name "custom.el" user-emacs-directory))
  ;; or
  ;; (setq custom-file (no-littering-expand-etc-file-name "custom.el"))
  :config
  (let ((dir (no-littering-expand-var-file-name "lock-files/")))
    (make-directory dir t)
    (setq lock-file-name-transforms `((".*" ,dir t))))
  (require 'recentf)
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-var-directory))
  (add-to-list 'recentf-exclude
               (recentf-expand-file-name no-littering-etc-directory)))

(provide 'asdasd-littering)