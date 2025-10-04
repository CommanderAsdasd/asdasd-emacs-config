(use-package org-ml)

(use-package org-ql
  :config
  (org-ql-select org-directory
  '(and (src-block) (not (ancestors (headline))))
  :action 'element))

;; (defun asdasd-org)
