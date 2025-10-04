(defun asdasd-emacs-profile-function (function &optional mode)
  ""
  (condition-case nil (progn (profiler-start (if mode mode 'cpu+mem))
                         (funcall function)
                         (profiler-stop)
                         (profiler-report))
    (profiler-stop)))


(asdasd-emacs-profile-function 'org-node-find)
