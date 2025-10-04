;; (use-package w32-browser)

(defun asdasd-os-win-wsl-p ()
  "is running on WSL"
  (cond ((getenv "WSLENV")
         t)))


(use-package emacs
  :custom (visible-bell 1))

(provide 'asdasd-os-win)
