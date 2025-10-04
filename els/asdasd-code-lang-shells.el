(require 'asdasd-os-win)
(use-package powershell)
(use-package ob-powershell
  :config )
(use-package bash-completion) 

(defun asdasd-code-lang-shells-region-as-async-shell-command (command)
  "Run the selected region as an async shell command."
  (interactive (list (read-shell-command "Shell command: "))
               ;; current-prefix-arg
               ;; shell-command-default-error-buffer
               )
  (async-shell-command
   (concat command " "
           (buffer-substring-no-properties
            (region-beginning)
            (region-end))) nil nil))

;; replaced with advice
;; (defun asdasd-async-shell-command (command &optional prompt)
;;   "wrapper to have COMMAND name in buffer name
;;    PROMPT formatted string - %s replaced by COMMAND"
;;   (interactive "sasync-shell-command: ") ;;   (let ((prompt (if prompt prompt "async-shell-command %s %s"))) (async-shell-command command (format prompt (format-time-string "%Y-%m-%d %H:%M:%S") command) (format prompt (format-time-string "%Y-%m-%d %H:%M:%S") command))))
;; (defun asdasd-async-shell-command-advice (orig-fun &rest args)
;;   ;; (if (= arg 4) (set 'default-directory (read-directory-name "Run in dir: ")))
;;   ;; (print args)
;;   (let* ((command (car args))
;;          (output-buffer (if (nth 2 args) (nth 2 args) "*Async Shell Command*"))
;;          (error-buffer (if (nth 3 args) (nth 3 args) "*Async Shell Command error*")))
;;     (apply orig-fun (list command (concat output-buffer " $ " command (format-time-string " [%Y-%m-%d %H:%M:%S]")) error-buffer))))
;; (advice-add 'async-shell-command :around #'asdasd-async-shell-command-advice)
;; (advice-remove 'async-shell-command 'asdasd-async-shell-command-filter-advice)

(defun asdasd-async-shell-command-advice (args)
  "Add date and command to output buffer name"
  (setf (nth 1 args) (concat (format-time-string "[%Y-%m-%d %H:%M:%S] ") (or (nth 1 args) shell-command-buffer-name-async) " $ " (nth 0 args)))
  args)

(advice-add 'async-shell-command :filter-args #'asdasd-async-shell-command-advice)

(defun asdasd-code-async-shell-command-rerun-last (&optional arg)
  "ARG for nth command in history"
  (interactive)
  (save-some-buffers t)
  (let ((command (nth (if arg arg 0) shell-command-history)))
    (asdasd-async-shell-command command "*Shell rerun %s")))

;; (defun asdasd-code-lang-shells-async-shell-cmd-exe ()
;;   ""
;;   (let ((shell-file-name ""))))

(use-package shell
  :bind
  ("C-!" . async-shell-command)
  ("M-&" . shell-command)
  :custom
  ((explicit-bash-args '("--login" "-i"))
   (shell-file-name "bash"))
  :config
  (setenv "SHELL" shell-file-name)
  ;; (add-hook 'shell-mode-hook
  ;;           (lambda () (setq default-directory "C:\\Users\\Downloads\\msys2\\home\\")))
  (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m))


(use-package project-shells)
(use-package shellcop)

 

(provide 'asdasd-code-lang-shells)
