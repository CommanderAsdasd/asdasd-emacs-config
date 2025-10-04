


;; (use-package info-rename-buffer 
;;   :config (info-rename-buffer-mode)
;;   )

(defun info-multiple ()
  (rename-buffer
   (format "*info %s*"
           (replace-regexp-in-string
            " > " "/"
            (substring-no-properties
             (Info-breadcrumbs) nil -1)))
   'unique))



(add-hook 'Info-selection-hook #'info-multiple)

(use-package helpful
  :bind ("C-h k" . helpful-key))
