;; try to be cross-platform
;; system-packages does same better 
(require 'asdasd-code-elisp-function-name)

 ;; (define-package "asdasd-os-pacman" "1.0"
;;   "simple interface to manage pacman"
;;   '(emacs "25.1"))

;; [2025-05-04]
(defun asdasd-os-pacman-install (package)
  "install PACKAGE"
  (interactive (list (read-string (format "%s:" (compile-time-function-name)))))
  (let ((process-name (format "*%s: %s*" (compile-time-function-name) package)))
    (switch-to-buffer-other-window (process-buffer (start-process process-name process-name "pacman" "-S" "--noconfirm" package))))
  (comint-mode))

(defun asdasd-os-pacman-uninstall (package)
  "install PACKAGE"
  (interactive (list (read-string (format "%s:" (compile-time-function-name)))))
  (let ((process-name (format "*%s: %s*" (compile-time-function-name) package)))
    (switch-to-buffer-other-window (process-buffer (start-process process-name process-name "pacman" "-R" "--noconfirm" (replace-regexp-in-string ".*/" "" package)))))
  (comint-mode))


(defun asdasd-os-pacman-search (package)
  "search PACKAGE"
  (interactive (list (read-string (format "%s:" (compile-time-function-name)))))
  (let ((process-name (format "*%s: %s*" (compile-time-function-name) package))
        (buffer-name (format "*%s %s: %s*" (format-time-string "[%Y-%m-%d %H:%M:%S]") (compile-time-function-name) package)))
    (switch-to-buffer-other-window (process-buffer
                                    (start-process process-name buffer-name "pacman" "-Ss" package))))
  (comint-mode))
(provide 'asdasd-os-pacman)

(use-package asdasd-os-pacman
  :straight nil
  :bind ;; (:map embark-identifier-map
        ;;       ("p" . system-packages-install)
        ;;       ("P" . asdasd-os-pacman-uninstall))
  )

