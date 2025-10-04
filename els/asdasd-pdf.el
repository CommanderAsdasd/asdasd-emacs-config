(use-package doc-view
  :custom (doc-view-continuous t))

(use-package doc-view-follow
  :config )

(use-package nov
  :config )

(defun asdasd-pdf-random-page ()
  ""
  (interactive)
  (pdf-view-goto-page (random (pdf-info-number-of-pages))))




(use-package pdf-tools
  :straight ;; (:host github :repo "vedang/pdf-tools")
  (:host github :repo "legends2k/pdf-tools")
  :config (pdf-tools-install))

(use-package org-noter)

(use-package org-noter-pdftools)

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

