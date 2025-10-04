

;; (straight-use-package
;;  `(org
;;    :type git
;;    :repo "https://code.orgmode.org/bzg/org-mode.git"
;;    :depth full
;;    :build (:not autoloads)
;;    :local-repo "org"
;;    :pre-build 
;;    ,(list
;;                 (concat (when (eq system-type 'berkeley-unix) "g")
;;                         "make")
;;                 "autoloads"
;;                 "EMACS=\"C:/Users/AleksandrTankovskii(/Downloads/emacs-30.1/bin/emacs.exe\"")
;;    :files (:defaults "lisp/*.el"
;;                      "contrib/lisp/*.el")))



(use-package org
  ;; :straight nil
  :straight (:type built-in)
   :preface (defun asdasd-note-org-insert-subheading-after ()
              "skips metadata and org-insert-subheading"
              (interactive)
              (org-end-of-meta-data)
              (org-insert-subheading nil))

   (defun asdasd-note-org-insert-subheading-safe ()
     "saves letter by inserting space"
     (interactive)
     (insert " ")
     (org-insert-subheading (prefix-numeric-value nil)))

   (defun asdasd-note-org-occur-src ()
     "occur only src blocks"
     (interactive)
     (org-occur "src"))
   
   :custom
   (org-cycle-separator-lines 0)
   (org-imenu-depth 10)
   (org-clock-persist t)
   (org-agenda-custom-commands
      '(("p" "Projects"
         ((tags-todo "CATEGORY=\"work\"")
          (tags-todo "CATEGORY=\"org\"")
          (tags-todo "BWAT-DFNG")))))
   (org-tags-column -80)
   (org-agenda-prefix-format "(%i %T) %-15c %t")
   (org-keep-stored-link-after-insertion t)
   (org-id-link-to-org-use-id t)
   (org-startup-truncated nil)
   (org-src-ask-before-returning-to-edit-buffer nil)
   (org-src-window-setup 'plain)
   (org-directory howm-directory)
   (org-indent-indentation-per-level 2)
   (org-fontify-done-headline t)
   (org-refile-targets '((nil :maxlevel . 10)))
   (org-timestamp-formats '("%Y-%m-%d %a" . "%Y-%m-%d %a %H:%M"))
   
   :bind*
   ;; (:repeat-map org-mode-repeat-map
   ;;      ("o" . org-babel-next-src-block)
   ;;      ("p" . org-babel-previous-src-block))
   ("C-c o l s" . org-store-link)
   (:map org-mode-map
         ("S-RET" . org-insert-heading-respect-content)
         ("C-c o g s" . org-babel-goto-named-src-block)
         ("C-c o g h" . consult-org-heading)
         ("C-c o o" . org-occur)
         ("C-c o s" . asdasd-note-org-occur-src)
         ("M-s M-m" . asdasd-note-org-insert-subheading-safe)
         ("M-s M-b" . org-metaleft)
         ("M-s M-n" . org-metadown)
         ("M-s M-p" . org-metaup)
         ("M-s M-f" . org-metaright)
         ("M-s K" . org-shiftleft)
         ("M-s O" . org-shiftdown)
         ("M-s P" . org-shiftup)
         ("M-s \"" . org-shiftright)
         ("M-s M-K" . org-shiftmetaleft)
         ("M-s M-O" . org-shiftmetadown)
         ("M-s M-P" . org-shiftmetaup)
         ("M-s M-\"" . org-shiftmetaright)
         ("C-c o l i" . org-insert-link)
         ("C-c C-S-O" . org-clock-goto)
         ("M-s M-M" . asdasd-note-org-insert-subheading-after)
         ("C-c C-." . echo
          ;; '(lambda () (interactive) (org-end-of-meta-data) (call-interactively 'org-insert-structure-template))
          )
         ("C-c o h" . org-fold-hide-sublevels)
         ;; ("C-c o h" . )
         )
   
   
   
   :config
   ;; (org-clock-auto-clockout)
   ;; (org-indent-mode)
   (setq org-todo-keywords
         '((sequence
            "TODO(t)" ; A task that needs doing & is ready to do
            "BLOCK(b)"
            "QUESTION(q)"
            "|"
            "DONE(d)" ; Task successfully completed
            "FAIL(n)")))
   
   (add-hook 'org-timer-set-hook #'org-clock-in)
   (add-hook 'org-timer-done-hook #'org-clock-out)
   (add-hook 'org-timer-stop-hook #'org-clock-out)
   (add-hook 'org-clock-in-hook #'org-id-get-create)
   (add-hook 'org-mode-hook (lambda () (auto-revert-mode 1)))
   (add-hook 'org-mode-hook (lambda () (org-indent-mode 1)))
   (dolist (file-app '(("\\.html\\'" . emacs)
                       ("\\.pdf\\'" . emacs)
                       ("\\.org\\'" . emacs)))
    
     (add-to-list 'org-file-apps
                  file-app))
  
   ;; (setq org-capture-templates
   ;;       '(("s" "Software Codebase Exploration" entry
   ;;          (file+headline "~/org/notes.org" "Software Codebase Exploration")
   ;;          "* %^{Title}\n  %U\n  %?\n  %a")))
   ;; (remove-hook 'org-mode-hook 'org-indent-mode)
   (add-hook 'org-mode-hook 'auto-revert-mode)
   (defun ndk/org-refile-candidates ()
     (directory-files org-directory t ".*\\.org$"))
   ;; (custom-theme-set-faces 'user
   ;; `(org-level-1 ((t (:background "#f0a100"))))
   ;; `(org-block ((t (:background "black")))))
   ;; )
   ;; (custom-theme-set-faces
   ;;  'user
   ;;  '(org-done ((t (:strike-through t :background "10bb80"))))
   ;;  '(org-headline-done ((t (:strike-through t))))
   ;;  '(org-block ((t (:inherit fixed-pitch) :background "006b2f" :size 14)))
   ;;  '(org-code ((t (:inherit (shadow fixed-pitch) :background "Dark slate gray"))))
   ;;  '(org-document-info ((t (:foreground "dark orange"))))
   ;;  '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   ;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   ;;  '(org-link ((t (:foreground "royal blue" :underline t))))
   ;;  '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   ;;  '(org-property-value ((t (:inherit fixed-pitch))) t)
   ;;  '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   ;;  '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   ;;  '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   ;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
  
   (setq org-src-block-faces
         '(("emacs-lisp" ())
           ("python" ())))
   (defface org-none-face
     '((t :strike-through t :foreground "red"))
     "Face for NONE state in Org-mode.")
   (setq org-todo-keyword-faces
         '(("DONE" . org-done)
           ("NONE" . org-none-face) ; Use the custom face for NONE state
           ))
  
   (add-hook 'emacs-startup-hook #'howm-menu))



(use-package org-cliplink)
(use-package plz)
(use-package esxml)
(use-package org-web-tools)

(use-package org-transclusion
  :bind ("C-c o t a" . org-transclusion-add)
  ("C-c o t A" . org-transclusion-add-all)
  ("C-c o t R" . org-transclusion-remove-all)
  ("C-c o t r" . org-transclusion-remove)
  ("C-c o t s" . org-transclusion-move-to-source))


(use-package outshine
  :bind
  (:map outshine-mode-map
         ;; ("C-c o g s" . org-babel-goto-named-src-block)
         ;; ("C-c o g h" . consult-org-heading)
         ;; ("C-c o o" . org-occur)
         ;; ("C-c o s" . asdasd-note-org-occur-src)
         ("M-s M-m" . outshine-insert-heading)
         ("M-s M-b" . outline-promote)
         ("M-s M-n" . outline-move-subtree-down)
         ("M-s M-p" . outline-move-subtree-up)
         ("M-s M-f" . outline-demote)
         ("M-n" . outline-next-heading)
         ("M-p" . outline-previous-heading)
         
         ;; ("M-s K" . org-shiftleft)
         ;; ("M-s O" . org-shiftdown)
         ;; ("M-s P" . org-shiftup)
         ;; ("M-s \"" . org-shiftright)
         ;; ("M-s M-K" . org-shiftmetaleft)
         ;; ("M-s M-O" . org-shiftmetadown)
         ;; ("M-s M-P" . org-shiftmetaup)
         ;; ("M-s M-\"" . org-shiftmetaright)
         ;; ("C-c o l s" . org-store-link)
         ;; ("C-c o l i" . org-insert-link)
         ;; ("C-c C-S-O" . org-clock-goto)
         ;; ("M-s M-M" . asdasd-note-org-insert-subheading-after)
         ;; ("C-c C-." . echo
         ;;  ;; '(lambda () (interactive) (org-end-of-meta-data) (call-interactively 'org-insert-structure-template))
         ;;  )
         ;; ("C-c o h" . org-fold-hide-sublevels)
         ;; ;; ("C-c o h" . )
         ;; )
  ))

(use-package org-include-inline
  :demand t
  :straight (:host github :repo "yibie/org-include-inline")
  :config )

(use-package org-remark
  )
