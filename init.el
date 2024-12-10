(defun asdasd-eval-buffer ()vl
  "TODO change into advice"
  (interactive)
  (eval-buffer)
  (message "evaluated buffer"))

(define-key emacs-lisp-mode-map (kbd "C-c b") 'asdasd-eval-buffer)

(setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "els" user-emacs-directory))
(load custom-file)
 
 ;; install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
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
(straight-use-package 'use-package)
(use-package emacs
  :custom (straight-use-package-by-default t)
  )


(defcustom els (expand-file-name "els/" user-emacs-directory)
  "directory where all the elisp files are stored."
  :type 'directory
  :group 'emacs)




(require 'asdasd-ux-config)
(asdasd-ux-config-load '("asdasd-init.el"))
