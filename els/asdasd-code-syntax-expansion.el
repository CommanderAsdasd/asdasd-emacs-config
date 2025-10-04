  (defvar lua-syntax-expansions
    '(("fn" "local function")))
  (defun lua-setup-abbrev-prettify ()
    (setq prettify-symbols-alist
          (mapcar (lambda (abbrev-exp)
                    (let ((abbrev (car abbrev-exp))
                          (exp (cadr abbrev-exp)))
                      `(,exp . ,(vconcat (cdr (mapcan (lambda (ch) (list '(Br . Bl) ch)) abbrev))))))
                  lua-syntax-expansions))
    (prettify-symbols-mode 1)
    (dolist (abbrev-exp lua-syntax-expansions)
      (apply #'define-abbrev local-abbrev-table abbrev-exp))
    (abbrev-mode))
