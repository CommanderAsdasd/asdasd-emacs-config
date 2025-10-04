;; common completion

(use-package emacs
  :config (add-to-list 'completion-at-point-functions 'comint-dynamic-complete-filename)
  :custom (tab-always-indent 'complete)
  )

;; (use-package cape
;;  :config
;;  (add-to-list 'completion-backends-alist '("org-tags". cape-org-tags))
;;    (add-to-list 'completion-at-point-functions #'cape-dabbrev)
;;   (add-to-list 'completion-at-point-functions #'cape-file)
;;   (add-to-list 'completion-at-point-functions #'cape-elisp-block)
;;   (add-to-list 'completion-at-point-functions #'cape-history)
;;   (add-to-list 'completion-at-point-functions #'cape-tex))


