(defun consult-org-babel-library-of-babel ()
  "Read and return the value of `org-babel-library-of-babel`."
  (interactive)
  (unless (and (boundp 'org-babel-library-of-babel)
               (consp org-babel-library-of-babel))
    (error "`org-babel-library-of-babel` is either undefined or not a cons cell"))
  (let* ((keys (mapcar #'car org-babel-library-of-babel))
         (key (intern (completing-read "Select key: " keys))))
    (assoc key org-babel-library-of-babel)))


