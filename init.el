;; README

;; TODO: sane folder structure
;; Integrate todo's with org-agend
;; write "open init.el" function
;; make a list of packages that I'm liked (from spacemacs and purcell's)
;; use package manager - el-get?

;; CONFIG
(add-to-list 'load-path (expand-file-name "els" user-emacs-directory))


;; MELPA workaround

;; (when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)
  

;; 

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(use-package try
  :ensure t)

;; 


(require 'asdasd-config-defaults)
(require 'asdasd-config-packages)

(require 'asdasd-unstable)
(require 'init-helm)
(require 'init-windmove)
(require 'init-orgmode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("/home/atankovskii/org-roam/"))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "/home/atankovskii/git/org-kasten/")
 '(package-selected-packages
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(find-file "~/.emacs.d/els/*el" t)
