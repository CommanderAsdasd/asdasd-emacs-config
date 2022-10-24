(setq async-shell-command-buffer 'new-buffer)

  

(global-set-key (kbd "C-c C-r") 'asdasd/async-shell-command-rerun-last)

(defun asdasd/shell-command-with-region-arg (command beginning end)
  "Prompt for a shell COMMAND, and use the region as an argument.
Buffer text from BEGINNING to END is passed as a single argument to COMMAND."
  (interactive (list (read-shell-command "Shell command: ")
                     (region-beginning)
                     (region-end)))
  (let ((region (buffer-substring-no-properties beginning end)))
    (shell-command (concat command " " (shell-quote-argument region)))))

(general-define-key      
 :prefix "M-q"
 "e l" 'asdasd/async-shell-command-rerun-last)

;; (defun asdasd-rerun-last-shell-command ()
  ;; (interactive)
  ;; (async-shell-command (car shell-command-history)))



;; set mingw bash as default shell
(setq shell-file-name "C:/msys64/usr/bin/bash.exe")

;; fix  tcsetattr: Inappropriate ioctl for device
(setq system-uses-terminfo nil)
  

(lambda (command) (asdasd-async-shell-command-to-buffer command ))

 ;; an argument of 1 will enable most modes

;; kill all async-shell-command buffers without confirmation
(defun asdasd-kill-async-shell-command-buffers ()
  (interactive)
  (mapc 'kill-buffer
        (delq nil
              (mapcar (lambda (buffer)
                        (and (buffer-live-p buffer)
                             (string-match "*Async Shell Command*" (buffer-name buffer))
                             buffer))
                      (buffer-list)))))

;; kill buffer without confirmation

;; rerun last command from shell-command-history

;; asdasd-dnd-insert-text for inserting file path in shell mode

;; clear dnd-protocol-alist locally



