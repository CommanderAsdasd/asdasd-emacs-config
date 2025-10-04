;; (defun asdasd-insert-mode-cursor ()
;;   (set-cursor-color "red")
;;   )

;; (defun asdasd-normal-mode-cursor ()
;;   (set-cursor-color "green")
;;   )
 
 

;; (defun asdasd-ui-cursor-meow-mode-check (&optional buffer1 buffer2)
;;   (cond
;;     ((eq meow-insert-mode t) (asdasd-insert-mode-cursor))
;;     ((eq (or meow-normal-mode meow-motion-mode) t) (asdasd-normal-mode-cursor))
;;     ((eq (and (meow-normal-mode-p) (meow-insert-mode-p)) nil) (set-cursor-color "blue")))
;;   ;; (if
;;   ;;   (if (and (eq meow-normal-mode nil)  (eq meow-insert-mode nil))
;;   ;;     ))
;;   )


 

(use-package emacs
  :config
  (setq-default cursor-type 'bar)
  ;; (add-hook 'meow-switch-state-hook 'asdasd-ui-cursor-meow-mode-check)
            ;; (add-hook 'meow-normal-mode-hook 'asdasd-ui-cursor-meow-mode-check)
  (blink-cursor-mode 3))

(use-package xhair)
(provide 'asdasd-ui-cursor)