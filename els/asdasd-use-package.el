

(require 'use-package)


(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
 (require 'el-get))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup)
  )


(use-package
  which-key :ensure t :config (which-key-mode))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  :ensure t
  :config (setq
   pipenv-projectile-after-switch-functiond
   #'pipenv-projectile-after-switch-extended))



(use-package org-pdftools
  :ensure t
  :hook (org-mode . org-pdftools-setup-link))

;; (use-package bookmark+
;;   :el-get g
;;   :ensure t
;;   ;; :config (require 'b)
;;   )

;; (use-package ox-moderncv
;;     :el-get t
;;     ;; :load-path "path_to_repository/org-cv/"
;;     :init (require 'ox-moderncv))

;; (use-package moccur-edit
;;   :ensure t)





;; (use-package epubmode-es
;;   :ensure t
;;   :el-get t)



(provide 'asdasd-use-package)

