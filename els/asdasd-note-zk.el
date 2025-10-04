(use-package org-zettelkasten)


(use-package zk
  :straight (zk :files (:defaults "zk-consult.el"))
  :custom (zk-directory howm-directory)
  :config
  (require 'zk-consult)
  (zk-setup-auto-link-buttons)
  (zk-setup-embark))

(use-package zk-desktop
  :custom (zk-desktop-directory zk-directory))

(use-package zk-index)

(use-package zk-luhmann)