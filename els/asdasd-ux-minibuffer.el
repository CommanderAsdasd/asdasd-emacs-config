(setq enable-recursive-minibuffers t)

(setq minibuffer-depth-indicate-mode t)

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(global-set-key (kbd "C-S-o") 'switch-to-minibuffer)

(global-set-key (kbd "C-S-g") (lambda () (interactive)
                                (switch-to-minibuffer)
                                (abort-minibuffers)))
(use-package emacs
  :custom (read-minibuffer-restore-windows nil))

;; (use-package mini-frame
;;   ;; :config (mini-frame-mode)
;;   :custom (mini-frame-show-parameters
;;    '((top . 0)
;;      (width . 1.0)
;;      (left . 0.5)
;;      (height . 15))))