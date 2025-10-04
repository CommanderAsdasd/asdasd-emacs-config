;; (use-package vscode-dark-plus-theme
;;   :config
;;   (load-theme 'vscode-dark-plus t)
;;   (set-frame-font "-outline-Source Code Pro-bold-normal-normal-mono-17-*-*-*-c-*-iso8859-7" nil t))

;; (use-package dracula-theme
;;   :config
 ;;   (load-theme 'dracula t)
;;   (set-frame-font "-outline-Source Code Pro-bold-normal-normal-mono-17-*-*-*-c-*-iso8859-7" nil t)
;;   )



(use-package emacs
  :bind ("C-c C-t" . toggle-theme)
  :config (load-theme 'modus-vivendi-tinted t)
  (set-frame-font "-outline-Consolas-bold-normal-normal-mono-18-*-*-*-c-*-iso10646-1" nil t))

(use-package load-theme-buffer-local)
