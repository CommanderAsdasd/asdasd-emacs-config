;; (use-package button-lock
;;   :ensure t
;;   :hook ((org-mode . my-org-servicenow-button))
;;   :config
;;   (defun my-org-servicenow-button ()
;;     (button-lock-mode 1)
;;     (button-lock-set-button
;;      "\\bINC[0-9]+\\b"
;;      (lambda ()
;;        (interactive)
;;        (browse-url (format "https://servicenow.com/%s" (match-string 0))))
;;      :face 'org-link)))

