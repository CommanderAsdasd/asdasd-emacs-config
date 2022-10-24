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

;; kill-

;; c:/170202_original.jpg


;; open url at point or find file at point via hippie-expand to key C-c C-f in every mode

(use-package smart-backspace
  :ensure t
  :config
  (define-key evil-insert-state-map [?\C-?] 'smart-backspace))

                  

;; https://emacs.stackexchange.com/questions/29/how-to-open-a-file-in-a-new-frame-without-closing-the-current-one

(provide 'asdasd-text)
