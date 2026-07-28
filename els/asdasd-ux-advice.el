(defun asdasd-ux-advice-vertico-sort-alpha (&rest args)
  "modify `vertico-sort-override-function` before `my-function` runs."
  ;; (setq vertico-sort-override-function #'vertico-sort-alpha)
  )

(defun asdasd-ux-advice-vertico-sort-alpha-post (&rest args)
  "Advice to modify `my-variable` before `my-function` runs."
  ;; (setq vertico-sort-override-function nil)
  )

(defun asdasd-ux-advice-vertico-sort-alpha-around (orig &rest args)
  "let bind `vertico-sort-override-function` before `my-function` runs."  
  (let ((vertico-sort-override-function 'vertico-sort-alpha))
    (apply orig args)))

(defun asdasd-ux-advice-add-newline (&rest _args)
  (insert "
"))

(provide 'asdasd-ux-advice)
