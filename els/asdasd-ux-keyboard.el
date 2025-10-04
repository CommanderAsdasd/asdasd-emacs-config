;; (use-package mode-line-keyboard
;;   :config )

;; (use-package sis
;;   :config
;;   (setq sis-respect-start 'english)
;;   (sis-ism-lazyman-config "1033" "2052" 'im-select)
;;   (sis-global-respect-mode t)
;;   (add-hook 'focus-in-hook #'sis-set-english))

(defvar asdasd-ux-keyboard-layout-eng '(1033 . 1033))
(add-hook 'focus-in-hook '(lambda () (w32-set-keyboard-layout asdasd-ux-keyboard-layout-eng)))
