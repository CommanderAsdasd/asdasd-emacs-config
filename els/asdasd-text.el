;; #+begin_src emacs-lisp :var bindings=bindings :colnames yes: 

;; (el-get-bundle subed
;;   :url "https://github.com/dustinlacewell/subed.git"
;;   :features subed)



;; (use-package subed
;;   ;; Tell emacs where to find subed
;;   :load-path "~/.emacs.d/el-get/subed/"
;;   :config
;;   ;; Disable automatic movement of point by default
;;   (add-hook 'subed-mode-hook 'subed-disable-sync-point-to-player)
;;   ;; Remember cursor position between sessions
;;   (add-hook 'subed-mode-hook 'save-place-local-mode)
;;   ;; Break lines automatically while typing
;;   (add-hook 'subed-mode-hook 'turn-on-auto-fill)
;;    ;; Break lines at 40 characters
;;   (add-hook 'subed-mode-hook (lambda () (setq-local fill-column 40))))

(defun kill-yank ()
  (lambda (char &optional buffer)
    (kill-new)
    (other-window buffer)
    (yank-pop))
  )

(defun asdasd-copy-to-other-buffer (&optional p)
  "copies region to other or specified buffer "
  (interactive "P")
  ;; why i did that
  (let* (($old-point (point)))
    (if (p)     
        ((other-buffer (read-buffer)
                       (kill-yank $old-point)))
      ((kill-yank $old-point)))))

(defun asdasd/kill-to-other-buffer ()
  (
   (get-region-content)))


(provide 'asdasd-text)
