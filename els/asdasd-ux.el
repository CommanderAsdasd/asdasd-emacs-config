(use-package reverse-im
  :config (reverse-im-mode))

(use-package which-key
 :config (which-key-mode))

(use-package ace-window :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(use-package ido-yes-or-no)

(use-package emacs
  :bind ("C-x C-c" . execute-extended-command)
  :custom (tab-always-indent t))

(use-package god-mode
  :bind
  ;; ("<escape>" . god-mode-all)
  )

(use-package inhibit-mouse)

;; (use-package non-edit-mode
;;   :after (god-mode)
;;   ;; :ensure t
;;   :config
;;   (define-key global-map (kbd "C-<tab>") #'non-edit-mode)
;;   (add-hook 'prog-mode-hook 'non-edit-mode))

;; (use-package 
  ;; :config )

;; (use-package etrace
  ;; )
