

(use-package pulse
  :config (defun pulse-point ()
  (interactive)
  (pulse-momentary-highlight-one-line (point)))
  :bind ("C-|" . pulse-point)
  )

(provide 'asdasd-ux-point)