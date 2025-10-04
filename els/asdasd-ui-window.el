(defun selected-window-accent ()
  (interactive)
  (set-face-background 'fringe "#77002e")
  (walk-windows
    (lambda (window)
        (if (eq window (selected-window))
          (progn
            (set-window-margins window 1 0)
            (with-selected-window window
              )
            (set-window-fringes window 10 0 t nil))
          (progn
            (set-window-margins window 2 0)
            (with-selected-window window
              )
            (set-window-fringes window 0 0 t nil))
          )
        )
    nil t))

;; (add-hook 'window-configuration-change-hook 'selected-window-accent)
;; (add-hook 'window-state-change-hook 'selected-window-accent)


(use-package quick-peek)
