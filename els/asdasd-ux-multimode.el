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
