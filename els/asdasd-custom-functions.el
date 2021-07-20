(require 'everything)

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



(global-set-key (kbd "C-S-M-s") 'isearch-other-window)

