(use-package nameframe)

(defun asdasd-ui-frame-set-alpha (percent)
  "sets frame alpha on PERCENT 1-100"
  (interactive "nAlpha percent: ")
  (set-frame-parameter nil 'alpha `(,percent . ,percent)))

(use-package frame
  :straight (:type built-in)
  :bind* ("C-c f a" . sdasd-ui-frame-set-alpha))