;; consult-global-mark + embark-act
;; (use-package mark-tools)

(use-package emacs
  :bind ("C-{" . pop-to-mark-command))

(use-package visible-mark
  :config (visible-mark-mode))

(use-package backward-forward
  :bind ("") )


(use-package back-button
  :bind* ("C-{" . back-button-local-backward)
  ("C-}" . back-button-local-forward)
  ("C-M-{" . back-button-global-backward)
  ("C-M-}" . back-button-global-forward))


;; (use-package smart-mark
;;   :)

