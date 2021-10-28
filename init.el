;; README

;; TODO: sane folder structure
;; Integrate todo's with org-agend
;; write "open init.el" function
;; make a list of packages that I'm liked (from spacemacs and purcell's)
;; use package manager - el-get?

;; CONFIG
(add-to-list 'load-path (expand-file-name "els" user-emacs-directory))
  



;; 

(require 'asdasd-packaging)
(require 'asdasd-keys)
(require 'asdasd-files)
(require 'asdasd-linux)


(require 'asdasd-config-defaults)




(require 'asdasd-ui)
(require 'asdasd-internet)

;; (require 'asdasd-windmove)
(require 'asdasd-org-mode)
(require 'asdasd-git)
(require 'asdasd-pdf)
(require 'asdasd-programming)
(require 'asdasd-cheatsheet)


(require 'asdasd-helm)
(require 'asdasd-unstable)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(org-agenda-files nil)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "/home/atankovskii/git/org-kasten/")
 '(package-selected-packages
   '(kubernetes-helm kubernetes helm-ring helm-info helm-sys helm-utils helm-adaptive helm-mode wikinforg exwm telega org-runbook magit winner-mode t)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
