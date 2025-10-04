(require 'cl)
(require 'cl-lib)

(defun call-stack ()
  "Return the current call stack frames."
  (let ((frames)
        (frame)
        (index 5))
    (while (setq frame (backtrace-frame index))
      (push frame frames)
      (incf index))
    (remove-if-not 'car frames)))


(defmacro compile-time-function-name ()
  "Get the name of calling function at expansion time."
  (symbol-name
   (cadadr
    (cl-third
     (cl-find-if (lambda (frame) (ignore-errors (equal (car (cl-third frame)) 'defalias)))
              (reverse (call-stack)))))))

(defun my-test-function ()
  (message "This function is named '%s'" (compile-time-function-name)))

(symbol-function 'my-test-function)
;; you can see the function body contains the name, not a lookup
(lambda nil (message "This function is named '%s'" "my-test-function"))

(my-test-function)

(provide 'asdasd-code-elisp-function-name)
