(guse-package 'everything)

(defun isearch-other-window ()
  "isearch in other window and back"
  (interactive)
  (other-window 1)
  (isearch-forward current-prefix-arg)
  (other-window -1)
  )

(defun everything-in-new-buffer () 
  "open list of found files in new buffer"
  
  ;; (switch-to-buffer "kek")
  (interactive)
  (let ((query "mp4")
	(new-buffer-name (concat "everything<" query ">"))
	(new-buffer (generate-new-buffer new-buffer-name)))
	;;(new-buffer )) 
    (insert-buffer-substring (everything-locate query))
    ) ;; how to create <2>
  )



(defun xah-new-empty-buffer ()
  "Create a new empty buffer. It returns the buffer (for elisp programing).

URL `http://ergoemacs.org/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))

(defun print-dir ()
  "docstring"
  (interactive)
  (let ((current-prefix-arg 4))
  (command-execute (read-directory-name "dir print")))
  )


(defun asdasd-kill-variable-value (var)
  "Kill variable name"
  (interactive)
  (kill-new (format "%s" (symbol-value (variable-at-point t))))
  )


(global-set-key (kbd "C-c C-c") 'kill-variable-value)


(defun asdasd-process-file (f)
  (save-excursion 
    (find-file f)
    (my-function)     ; Call your function here.
    (write-file f)
    (kill-buffer (current-buffer))))

(defun asdasd-bookmark-configs ()
  ;; (interactive "")
  (mapc 'bookmark-
        (directory-files (concat user-emacs-directory "/els/")
         nil "asdasd.*.el$")))




  
(global-set-key (kbd "C-S-M-s") 'isearch-other-window)

