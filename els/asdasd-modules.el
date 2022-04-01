(require 'cl)

;; (defmacro agile-modules-all (dir)
  
;;    (let ((modules ()))
;;   (cl-loop for file in (directory-files dir 0 ".*.el") by (add-to-list 'modules file))))

;; (agile-modules-all ELS)


          

;; (fill-modular-config)









;; (defun modular-packages-list ()
;;   ;; (let ((x 1))
;;   (print x)
;;   (setq x (+ x 1))
;;   )

;; ;; * lexical binding example

;; (let ((x 1))    ; if x is lexically bound.
;;   (+ x 3))

;; (defun getx ()
;;   x)            ; x is used free in this function.


;; (let ((x 1))    ; without lexical bounding will find "x" in dynamic scope
;;   (getx)) ; basically it will not collapse with same values in one file (lexical scope)
;; ;; and every function can be in own scope






(provide 'asdasd-modules)
