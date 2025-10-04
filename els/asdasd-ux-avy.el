(use-package avy
  :init   
  (require 'asdasd-ux-help)

  (defun avy-action-helpful (pt)
    (save-excursion
      (goto-char pt)
      (helpful-at-point))
    (select-window (cdr (ring-ref avy-ring 0))) t)
  

  (setf (alist-get ?H avy-dispatch-alist) 'avy-action-helpful)
  :custom (avy-timeout-seconds .6)
  (avy-keys '(107 111 112 39))
  (avy-style 'at)

  :bind*
  ("M-I" . avy-goto-char-timer)
  )

(use-package ace-window
  :custom (aw-keys '(?k ?o ?p ?'))
  :bind* ("C-<tab>" . 'ace-window)
  ("C-S-<tab>" . ace-swap-window))

(use-package avy-zap)

(use-package link-hint
  :bind
  ("C-M-S-i" . link-hint-open-link))
