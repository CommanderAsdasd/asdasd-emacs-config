(setq async-shell-command-buffer 'new-buffer)

(defun asdasd/async-shell-command-rerun-last (args)
  "rerun last command from shell-command-history"
  (interactive "P")
  (save-buffer)
  (async-shell-command (car shell-command-history))
  )

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

(use-package company-shell
  :ensure t
  :config 
  (add-hook 'minibuffer-setup-hook 'company-shell))

 ;; an argument of 1 will enable most modes

(remove-hook 'minibuffer-setup-hook 'company-shell)
