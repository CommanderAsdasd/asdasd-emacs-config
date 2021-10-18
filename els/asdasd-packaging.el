
;;###autoload
;; (defun asdasd-packaging-preconfigure ()
   "docstring"
  ;; (interactive)
  (require 'package)

  ;; (unless (require 'el-get nil 'noerror)
    (require 'package)
    (add-to-list 'package-archives
		 '("melpa" . "http://melpa.org/packages/"))
    (package-refresh-contents)
    (package-initialize)
    ;; (package-install 'el-get)
    ;; )

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))
;; )


(setq use-package-always-ensure t)
(use-package el-get)
  
  ;; )



;; (require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; (el-get 'sync)

;; Mode



(setq lazy-highlight-buffer nil)
;; keys




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


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c s") 'helm-swoop)

(use-package expand-region
:ensure t
:config
)






;; (use-package org-noter
;;   :config
;;   ;; Your org-noter config ........
;;   (require 'org-noter-pdftools))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freestyle-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

()

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (require 'package)
;;   (add-to-list 'package-archives
;;                '("melpa" . "http://melpa.org/packages/"))
;;   (package-refresh-contents)
;;   (package-initialize)
;;   (package-install 'el-get)
;;   (require 'el-get))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)

;; (setq el-get-sources
;;       '(el-get package

;; 	       (:name freeplane-mode
;; 	       	      :type git
;; 	       	      :url "git:https://github.com/fnatter/org-freeplane"
;; 	       	      ;; :after (lambda ()
;; 	       		  ;;      (autoload 'yaml-mode "yaml-mode" nil t)
;; 	       		  ;;      (add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode)))
;;                   :load "org-freeplane.el"
;;                   )
;; 	       )



(org-babel-do-load-languages 'org-babel-load-languages
    '(
        (shell . t)
    )
    )

;; (use-package org-babel-sr)

;; (defun org-keys-hook ()
;;   ;; 
;;   )

(global-set-key (kbd "C-c e") 'org-babel-execute-src-block)

(remove-hook 'org-mode-hook(lambda () (local-set-key (kbd "C-c e") 'org-babel-execute-src-block) ) )
      

(add-hook 'pdf-view-mode-hook (lambda ()
                                (global-set-key (kbd "C-c p") 'pdf-outline)
                                (local-set-key (kbd "C-c o") 'pdf-occur)))

(global-set-key (kbd "C-c k") 'browse-kill-ring)
(progn (undo-tree-mode) (global-set-key (kbd "C-c u") 'undo-tree-visualize))


(progn (setq markdown-enable-wiki-links t)
(setq markdown-link-space-sub-char " ")
(setq markdown-wiki-link-search-type '(project)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.

(package-initialize)


(tab-bar-mode)


(global-set-key (kbd "C-<f1>") 'tab-bar-switch-to-prev-tab)
(global-set-key (kbd "C-<f2>") 'tab-bar-switch-to-next-tab)

(use-package undo-tree
  :ensure t)


(use-package try
  :ensure t)


(provide 'asdasd-packaging)