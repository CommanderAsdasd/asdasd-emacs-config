(defun asdasd-os-clipboard-howm-clipboard-exchanger ()
  "workaround for a broken clipboard"
  (write-region (car kill-ring) nil (expand-file-name "clipboar" howm-directory) 'append))

(use-package clipmon
  :bind* ("M-s c m" . clipmon-autoinsert-toggle)
  :config (clipmon-mode)
  (add-hook 'clipmon-mode-hook ()))

(use-package ox-clip)

