;; README

;; TODO: sane folder structure
;; Integrate todo's with org-agend
;; write "open init.el" function
;; make a list of packages that I'm liked (from spacemacs and purcell's)
;; use package manager - el-get?

;; CONFIG
(add-to-list 'load-path (expand-file-name "els" user-emacs-directory))
(require 'asdasd-config-defaults)
(require 'asdasd-config-packages)

(require 'asdasd-unstable)
(require 'init-helm)
(require 'init-windmove)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "/home/atankovskii/git/org-kasten/")
 '(package-selected-packages
   '(expand-region queue gnu-elpa-keyring-update helm-cider pyenv-mode selectrum helm-org helm-descbinds helm-ls-git python-info iedit multiple-cursors helm-swoop powershell helm auto-virtualenv pomidor pomodoro telega pdf-tools github-se arch github-explorer firefox-controller processing-mode ace-window idomenu company-c-headers origami-predef groovy-mode origami org-roam kubernetes use-package neuron-mode google-translate howdoi ## cider ffmpeg-player elpy edit-server glsl-mode company-tabnine company magit browse-kill-ring artbollocks-mode dracula-theme))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
