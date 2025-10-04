(use-package xref
  :straight (:type built-in))

(use-package indent
  :bind*
  (:map indent-rigidly-map
        ("C-S-M-k" indent-rigidly-left-to-tab-stop)))

(use-package outline
  :config (add-hook 'prog-mode 'outline-minor-mode))


(use-package nocomments-mode)
(use-package outline-indent
  :config   (add-hook 'yaml-mode-hook #'outline-indent-minor-mode)
  (add-hook 'yaml-ts-mode-hook #'outline-indent-minor-mode)
)

(use-package polymode
  :config
  (define-hostmode poly-howmc-org-hostmode :mode 'howm-view-contents-mode)
  (define-innermode poly-howmc-org-innermode
    :mode 'org-mode
    :head-matcher "\* \[\["
    :tail-matcher "\* "
    :head-mode 'host
    :tail-mode 'host)
  (define-polymode poly-howmc-org-mode
    :hostmode 'poly-howmc-org-hostmode
    :innermodes '(poly-howmc-org-innermode))
  )

(use-package mmm-mode
  :config )

(use-package refactor
  )

(provide 'asdasd-code)
