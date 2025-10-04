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
  :config

  (if (asdasd-os-win-wsl-p)
      (progn
        (load-theme 'tsdh-light t)
        (set-frame-font "-PfEd-DejaVu Sans Mono-regular-normal-normal-*-16-*-*-*-m-0-iso10646-1" nil t))
    (set-frame-font "-outline-Consolas-regular-normal-normal-mono-20-*-*-*-c-*-iso10646-1" nil t)
    (load-theme 'modus-operandi-tinted t)
      )
  )

(use-package load-theme-buffer-local)
