(use-package reverse-im
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode))

(use-package which-key
 :config (which-key-mode))

(use-package ace-window :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(use-package ido-yes-or-no)

(use-package emacs
  :bind ("C-x C-c" . inhibit-mouse-mode)
  :custom (tab-always-indent t))

(use-package god-mode
  :bind
  ;; ("<escape>" . god-mode-all)
  )

(use-package inhibit-mouse)

(defun asdasd-ux-vertico-sort-type-advice (orig-fun &rest args)
  (setq-local vertico-sort-function 'vertico-sort-history-length-alpha)
  (let ((vertico-sort-function 'vertico-sort-history-length-alpha))
    (apply orig-fun args)))

(advice-add 'execute-extended-command :around #'asdasd-ux-vertico-sort-type-advice)
;; (advice-remove 'execute-extended-command #'asdasd-note-org-node-vertico-alpha-sort-advice)

;; (use-package non-edit-mode
;;   :after (god-mode)
;;   ;; :ensure t
;;   :config
;;   (define-key global-map (kbd "C-<tab>") #'non-edit-mode)
;;   (add-hook 'prog-mode-hook 'non-edit-mode))

;; (use-package d
  ;; :config )

;; (use-package etrace
  ;; )
