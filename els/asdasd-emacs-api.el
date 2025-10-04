;; hint-functions for emacs API

(defun asdasd-emacs-api-executable-find (executable)
  ""
  (interactive "Mwhereis:")
  (message (executable-find executable)))

(defun asdasd-insert-keybinding ()
  "Insert keybinding."
  (interactive)
  (let ((keybinding (read-key-sequence "Press keys: ")))
    (insert (kbd keybinding))))


