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


(defun my-dabbrev-fix (orig &rest args)
  (let ((started-with-dollar
         (save-excursion
           (skip-syntax-backward "w_")
           (eq (char-before) ?$))))
    (if started-with-dollar
        ;; Keep normal syntax: $WORD completes as $WORD
        (apply orig args)
      ;; Otherwise treat $ as punctuation: WORD completes from $WORD
      (with-syntax-table (copy-syntax-table (syntax-table))
        (modify-syntax-entry ?$ ".")
        (apply orig args)))))

(advice-add 'dabbrev-expand :around #'my-dabbrev-fix)

