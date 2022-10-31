;; 
(defun asdasd-eval-buffer ()
  (interactive)
  (eval-buffer)
  (message "evaluated buffer"))

(define-key emacs-lisp-mode-map (kbd "C-c b") 'asdasd-eval-buffer)


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



(defcustom els (concat user-emacs-directory "els")
  "directory where all the elisp files are stored."
  :type 'directory
  :group 'emacs)



(use-package modular-config
  :straight t
  :custom (modular-config-path els)
  :config
  (modular-config-command-line-args-process)
  )

(use-package helm-modular-config
  :straight (helm-modular-config :type git :host github :repo "CommanderAsdasd/emacs-helm-modular-config")
  :config (global-set-key (kbd "C-c m") 'helm-modular-config)
  )


(modular-config-load-modules '(asdasd-ui asdasd-evil
                                         asdasd-shell-mingw-bash
                                         asdasd-vertico-consult
                                         asdasd-backups
                                         asdasd-window-manage
                                         asdasd-copilot
                                         asdasd-leader
                                         asdasd-git
                                         asdasd-rgrep
                                         ))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/asdbookmarks")
 '(warning-suppress-log-types '((use-package)))
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
