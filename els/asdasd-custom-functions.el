
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





(defun asdasd-yank-region-other-window (args)
  "docstring"
  (interactive "P")
  (kill-new (buffer-substring-no-properties (region-beginning) (region-end))) ;
  (other-window 1)
  (yank)      ;
  (other-window -1)
  (keyboard-quit)
  )


(defun asdasd-mark-line () ;
  "docstring"
  (interactive)
  (let (p1 p2)
    (setq p1 (line-beginning-position))
    (setq p2 (line-end-position)) ;
    (goto-char p1)
    (push-mark p2)
    (setq mark-active t))
  )


(defun asdasd-copy-filepath (args)
  "copy current buffer to path"
  (interactive)
  (kill-new buffer-file-truename)
  )




(global-set-key (kbd "C-S-M-s") 'isearch-other-window)

(show-paren-mode)

(defun youtube-dl ()
  "url of youtube-video and path save to"
  (interactive (let (
                     (url (read-string "Url: "))
                     (path (read-directory-name "Path: " "c:"))
                     )
                 (with-temp-buffer
                   (async-shell-command (format "cd '%s' & youtube-dl %s" path url))
                   )))
  (message "%s" (buffer-string)))


(defun ffmpeg-convert-to-format ()
  "url of youtube-video and path save to"
  (interactive (let* (
                     (_file (read-file-name "file: "))
                     (_directory (read-directory-name "save to"))
                     (_format (read-string "extension: " "mp4"))
                     ;; (_parameters (read-string "parameters: " "-map 0 -c:v png -c:a copy")
                                  )
                     )
                 
                 (with-temp-buffer
                   (async-shell-command (format "ffmpeg -i '%s' %s '%s/%s.%s'" _file _parameters  _directory (file-name-nondirectory _file)  _format))
                   )))
  (message "%s" (buffer-string))




(defun helm-jump-in-buffer () 
  "Jump in buffer using `imenu' facilities and helm." 
  (interactive) 
  (call-interactively (cond ((eq major-mode 'org-mode) 'helm-org-in-buffer-headings) 
			    (t 'helm-semantic-or-imenu))))


(global-set-key (kbd "M-!") 'async-shell-command)
(global-set-key (kbd "C-M-!") 'shell-command)
(global-set-key (kbd "<f7>") 'comint-kill-subjob)

;; (helm :sources 'helm-semantic-or-imenu
;;           :prompt "Search Package: "
;;           :input query
;;           :buffer "*helm apt*"
;;           :history 'helm-imenu-history)


(defun run-python-interpreter ()
  (interactive (let ((python-shell-interpreter (read-file-name "Interpreter path: " ""))
                     )
                 (run-python))))


(defun pacman-do (action)
  "generic for sending commands to pacman"
  (let* ((command (concat "pacman " action " &")))
      (async-shell-command command (generate-new-buffer command))
      )
  )

(defun pacman-do-interactive
    (interactive))

(defun pacman-search (package)
  "search "
  (interactive "P")
    (pacman-do (concat "-Ss" ))
    )

(defun pacman-install (arg package)
  "docstring"
  (interactive "M\nbInstall package: " "Mtest") 
  (pacman-do (concat "-S" package))
  )



(defun asdasd-set-keys (args)
  "docstring"
  (interactive "P")
  )

(defun clip-file ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      (file-name-directory default-directory)
                    (buffer-file-name))))
    (when filename
      (x-select-text filename))))


(global-set-key (kbd "C-c C-v") "clip-file")


;; if i ill u
;; (defun helm-swoop-directory (dir)
;;   "do a helm-swoop over files in directory"
;;   (interactive "sDir"))

;;  ;;  (mapc
;;  ;; (lambda (x) (insert x "\n"))
;;  ;; (directory-files "/users/x/em/emacs/i" nil "\.jpg$" t))

  
;;   (with-temp-buffer (directory-files dir t t))
;;   )

(defun vcv-rack-run (args)
  "runs vcv rack for debug"
  (interactive "P")
  (generate-new-buffer "Rack log")
  (async-shell-command "c:/Program\\ Files/VCV/Rack/Rack.exe")
  )


;; (let* ((python-shell-interpreter "C:/Anaconda3/python.exe"))
;;   )

;; (defun fun (args)
;;   "docstring"
;;   (interactive "P")
;;   )

(use-package speed-type
  :ensure t)


()

(provide 'asdasd-custom-functions)

;; (let ((value
;;        (read-from-minibuffer "enter value:" "default" nil nil
;;                              "kek"))
;;       (value2 "kek"))
;;   (if (and (equal value "") "default")
;;       (if (consp "default") (car "default") "default")
;;     value value2))
