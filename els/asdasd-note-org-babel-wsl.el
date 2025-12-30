;; in your init.el or equivalent  
(require 'org)
(require 'ob-shell)

;; 1) tell Babel about “wsl”
(add-to-list 'org-babel-load-languages '(wsl . t))

;; 2) use sh-mode for syntax highlighting
(add-to-list 'org-src-lang-modes '("wsl" . sh))

;; 3) convert the temp-file path, then exec under WSL
(defun org-babel-execute:wsl (body params)
  "Execute BODY inside WSL via `wsl.exe`, converting the temp-file path."
  (let* ((tmpfile     (org-babel-temp-file "wsl-"))
         ;; write the script out
         (_           (with-temp-file tmpfile (insert body)))
         ;; convert C:/.../tmp → /mnt/c/.../... style
         (unix-path   (string-trim
                       (shell-command-to-string
                        (format "wsl.exe wslpath -u \"%s\"" tmpfile))))
         ;; build the full WSL command
         (wsl-cmd     (format "bash -l -c %s"
                              (shell-quote-argument
                               (concat "bash "
                                       (shell-quote-argument unix-path))))))
    ;; run wsl.exe with our command
    (org-babel-eval (concat "wsl.exe " wsl-cmd) "")))

;; 4) default to plain output
(setq org-babel-default-header-args:wsl
      '((:results . "output")))