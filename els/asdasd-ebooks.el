
(use-package pdf-tools
  :ensure t
  :config (pdf-tools-install))

(use-package org-pdftools

  :ensure t)

(use-package nav
  :config

  )

(use-package justify-kp
  :straight
  (:host github :repo "Fuco1/justify-kp" :branch "main" :files ("*.el" "out"))
  :after nav
  :config

  )

(use-package ereader
  :config
  )

(use-package djvu
  :config

  )

(provide 'asdasd-ebooks)
