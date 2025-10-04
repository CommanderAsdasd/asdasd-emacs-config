(defun asd-fun (&rest args)
  args)

(asd-fun 1 2 3)

(defun asd-fun-filter-advice (&rest args)
  "Filter out the third argument."
  (let ((args (car args))) (setf (nth 0 args) "kek")
       args))

(advice-add 'asd-fun :filter-args #'asd-fun-filter-advice)
(advice-remove 'asd-fun 'asd-fun-filter-advice)
