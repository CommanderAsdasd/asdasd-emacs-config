(defun asdasd-ux-advice-vertico-sort-alpha (&rest _args)
  "Advice to modify `my-variable` before `my-function` runs."
  (setq vertico-sort-function #'vertico-sort-alpha))

(provide 'asdasd-ux-advice)