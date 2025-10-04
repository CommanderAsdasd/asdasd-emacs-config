;; hint-functions for emacs API
(require 'cl)
(require 'cl-lib)
(require 'asdasd-ux-text)


(defun call-stack ()
  "Return the current call stack frames."
  (let ((frames)
        (frame)
        (index 5))
    (while (setq frame (backtrace-frame index))
      (push frame frames)
      (incf index))
    (remove-if-not 'car frames)))




(defun asdasd-emacs-api-executable-find (executable)
  ""
  (interactive "Mwhereis:")
  (message (executable-find executable)))

(defun asdasd-emacs-api-insert-keybinding ()
  "Insert keybinding."
  (interactive)
  (let ((keybinding (read-key-sequence "Press keys: ")))
    (insert (kbd keybinding))))

(defmacro compile-time-function-name ()
  "Get the name of calling function at expansion time."
  (symbol-name
   (cadadr
    (cl-third
     (cl-find-if (lambda (frame) (ignore-errors (equal (car (cl-third frame)) 'defalias)))
              (reverse (call-stack)))))))



(provide 'asdasd-emacs-api)
