(require 'windmove)

(asdasd-ux-config-load '("asdasd-general.el"))


(use-package winner
  :config
  (winner-mode)
  :bind*
  ("M-O" . 'winner-undo)
  ("M-P" . 'winner-redo) 
  )

(defun slide-buffer (dir)
    "Move current buffer into window at direction DIR.
DIR is handled as by `windmove-other-window-loc'."
    
    (let ((buffer (current-buffer))
          (target (windmove-find-other-window dir)))
      (if (null target)
          (user-error "There is no window %s from here" dir)
        (switch-to-prev-buffer)
        (select-window target)
        (switch-to-buffer buffer nil t))))

(defun asdasd-other-frame-wrapper (dir)
  "switches 1 or 2 windows in DIR"
  (unless
      (other-frame
       (cond
        ((eq dir 'up)  1)
        ((eq dir 'down) -1)
        ((eq dir 'left) -1)
        ((eq dir 'right) 1)
        (nil )))
    (user-error "frame %s from here" dir)))

(defun asdasd-windmove-wrapper (dir)
  "selects other window if no buffer in DIR"
  (interactive)
  (let ((target (windmove-find-other-window dir)))
    (if target (select-window target)
      (message "no window")
        (asdasd-other-frame-wrapper dir))))


(defun asdasd-windmove-wrapper-up () (interactive) (asdasd-windmove-wrapper 'up))
(defun asdasd-windmove-wrapper-down () (interactive) (asdasd-windmove-wrapper 'down))
(defun asdasd-windmove-wrapper-left () (interactive) (asdasd-windmove-wrapper 'left))
(defun asdasd-windmove-wrapper-right () (interactive) (asdasd-windmove-wrapper 'right))


(use-package windmove
  :init  
  (defun slide-buffer-up () (interactive) (slide-buffer 'up))
  (defun slide-buffer-down () (interactive) (slide-buffer 'down))
  (defun slide-buffer-left () (interactive) (slide-buffer 'left))
  (defun slide-buffer-right () (interactive) (slide-buffer 'right))

  :bind*
  ("C-k" . kill-line)
  ("C-S-K" . 'asdasd-windmove-wrapper-left)
  ("C-S-o" . asdasd-windmove-wrapper-down)
  ("C-S-p" . asdasd-windmove-wrapper-up)
  ("C-\"" . asdasd-windmove-wrapper-right)
  ("C-M-K" . slide-buffer-left)
  ("C-M-S-o" . slide-buffer-down)
  ("C-M-S-p" . slide-buffer-up)
  ("C-M-\"" . slide-buffer-right))

(use-package emacs
  :config
  :bind*
  ;; ("n" . self-insert-command)
  ("M-K" . 'previous-buffer)
  ("M-\"" . 'next-buffer))

(use-package ace-window
  :straight t)

(use-package es-windows)

(use-package centered-window
  :config (centered-window-mode))

(defun asdasd-ux-window-split-and-follow (&optional arg)
  ""
  (interactive "P")
  
  (if (= (or arg 1) 0) (delete-other-windows))
    (dotimes (_ (if (> (or arg 0) 0) arg 1))
      (split-window-right))
    (balance-windows)
    (follow-mode))


(defun asdasd-ux-window-split-window-below-and-previous-buffer (&optional arg)
  ""
  (interactive "P")
    (split-window-below)
    (previous-buffer arg))

(defun asdasd-ux-window-split-window-right-and-previous-buffer (&optional arg)
  ""
  (interactive "P")
    (split-window-right)
    (previous-buffer arg))

(use-package follow
  :bind ("C-x C-1" . 'asdasd-ux-window-split-and-follow)
  ("C-x C-2" . 'asdasd-ux-window-split-window-below-and-previous-buffer)
  ("C-x C-3" . 'asdasd-ux-window-split-window-right-and-previous-buffer))

(use-package activities
  :init
  (activities-mode)
  (activities-tabs-mode)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)

  :bind
  (("C-x C-a n" . activities-new)
   ("C-x C-a C-d" . activities-define)
   ("C-x C-a C-a" . activities-resume)
   ("C-x C-a C-s" . activities-suspend)
   ("C-x C-a C-k" . activities-kill)
   ("C-x C-a RET" . activities-switch)
   ("C-x C-a b" . activities-switch-buffer)
   ("C-x C-a g" . activities-revert)
   ("C-x C-a l" . activities-list)))
