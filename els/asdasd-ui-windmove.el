

(defun slide-buffer (dir)
  "Move current buffer into window at direction DIR.
DIR is handled as by `windmove-other-window-loc'."
  (require 'windmove)
  (let ((buffer (current-buffer))
        (target (windmove-find-other-window dir)))
    (if (null target)
        (user-error "There is no window %s from here" dir)
      (switch-to-prev-buffer)
      (select-window target)
      (switch-to-buffer buffer nil t))))

(defun slide-buffer-up () (interactive) (slide-buffer 'up))
(defun slide-buffer-down () (interactive) (slide-buffer 'down))
(defun slide-buffer-left () (interactive) (slide-buffer 'left))
(defun slide-buffer-right () (interactive) (slide-buffer 'right))



(define-key global-map (kbd "C-S-<up>")    #'slide-buffer-up)
(define-key global-map (kbd "C-S-<down>")  #'slide-buffer-down)
(define-key global-map (kbd "C-S-<left>")  #'slide-buffer-left)
(define-key global-map (kbd "C-S-<right>") #'slide-buffer-right)


(define-key global-map (kbd "C-c <C-left>") 'windmove-left)
(define-key global-map (kbd "C-c <C-down>") 'windmove-down)
(define-key global-map (kbd "C-c <C-up>") 'windmove-up)
(define-key global-map (kbd "C-c <C-right>") 'windmove-right)



(provide 'asdasd-ui-windmove)
