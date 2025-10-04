(defcustom asdasd-package-straight-dir "~/.cache/emacs/" "dir for straight builds")

;; don’t install or build “project”, use Emacs’s built-in version
;; (setq straight-disabled-packages '(project flymake org))


(setq straight-base-dir asdasd-package-straight-dir)
(setq straight-use-package-by-default t)
(setq straight-use-symlinks nil)
(setq straight-use-version-specific-build-dir t)


;; install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" asdasd-package-straight-dir))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; https://shivjm.blog/switching-to-straight-el/
;; (setq straight-build-dir "~/.straight-build")

(straight-use-package 'use-package)

(use-package straight)


(provide 'asdasd-package-straight)
