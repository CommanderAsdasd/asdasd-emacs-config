(use-package nameframe)

(defun asdasd-ui-frame-set-alpha (percent)
  "sets frame alpha on PERCENT 1-100"
  (interactive "nAlpha percent: ")
  (set-frame-parameter nil 'alpha `(,percent . ,percent)))

(use-package emacs
  :bind* ("C-c f a" . asdasd-ui-frame-set-alpha))
