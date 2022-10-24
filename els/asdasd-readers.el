(use-package tldr
  :ensure t)


;; pdf-tools setup
(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install)
  (setq pdf-tools-enabled t)
  (setq pdf-view-midnight-colors '("#fdf4c1" . "#1d1f21"))
  (add-hook 'pdf-view-mode-hook 'pdf-view-midnight-minor-mode)
  (add-hook 'pdf-view-mode-hook 'pdf-view-fit-page-to-window)
  (add-hook 'pdf-view-mode-hook 'pdf-view-auto-revert-mode  ))






(provide 'asdasd-readers)
