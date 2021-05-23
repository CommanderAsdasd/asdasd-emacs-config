;; this file setups packages config (swtich off in case of issues)
(require 'use-package)

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "/home/atankovskii/git/org-kasten/")
 '(package-selected-packages
   '(origami-predef groovy-mode origami org-roam kubernetes use-package neuron-mode google-translate howdoi ## cider ffmpeg-player elpy edit-server glsl-mode company-tabnine company magit browse-kill-ring artbollocks-mode dracula-theme))
 '(winner-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

;; Mode
(company-mode)

(setq lazy-highlight-buffer nil)
;; keys

(progn 
(global-set-key (kbd "C-?") 'company-select-next-if-tooltip-visible-or-complete-selection)
(global-set-key (kbd "C-c e") 'everything)

;; (global-set-key (kbd "C-c s") 'hs-show-all)
;; (global-set-key (kbd "C-c f") 'hs-hide-all) ;fold
(global-set-key (kbd "M-s i") 'imenu)
)

(setq processing-location "E:/downloads_23.06/processing-3.5.4/processing-java.exe")
(setq processing-application-dir "E:/downloads_23.06/processing-3.5.4") 
(setq processing-sketchbook-dir "/path/to/processing-sketchbook-dir")


;; (bind-keys :map global-map_
;;             :prefix "`"
;;             :prefix-map my-prefix-map
;;             ("-" . split-window-below)
;;             ("|" . split-window-right)
;;             ("d" . delete-window)
;;             ("n" . other-window)
;;             ("h" . windmove-left)
;;             ("j" . windmove-down)
;;             ("k" . windmove-up)
;;             ("l" . windmove-right))


(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "C-c l") 'org-insert-link)
(global-set-key (kbd "C-c C-f") 'org-roam-find-file)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c s") 'helm-swoop)
(global-set-key (kbd "M-s x") 'helm-M-x)


(use-package elpy
    :init
    (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
    :bind (:map elpy-mode-map
	      ("<M-left>" . nil)
	      ("<M-right>" . nil)
	      ("<M-S-left>" . elpy-nav-indent-shift-left)
	      ("<M-S-right>" . elpy-nav-indent-shift-right)
	      ("M-." . elpy-goto-definition)
	      ("M-," . pop-tag-mark))
    :config
    (setq elpy-rpc-backend "jedi"))

(use-package python
  :mode ("\\.py" . python-mode)
  :config
  (setq python-indent-offset 4)
  (elpy-enable))

(use-package pyenv-mode
  :init
  (add-to-list 'exec-path "~/.pyenv/shims")
  (setenv "WORKON_HOME" "~/.pyenv/versions/")
  :config
  (pyenv-mode)
  :bind
  ;; ("C-x p e" . pyenv-activate-current-project)
  )
;; (global-set-key (kbd "C-c l") 'org-roam-)

(provide 'asdasd-config-packages)
