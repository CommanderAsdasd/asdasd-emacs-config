(use-package uniline
  :straight (:host github :repo "tbanel/uniline"))

(use-package org-mind-map
  :straight (:host github :repo "nowislewis/org-mind-map")
  :init (require 'ox-org)
  :ensure t
  ;; Uncomment the below if 'ensure-system-packages` is installed
  ;;:ensure-system-package (gvgen . graphviz)
  :config
  (setq org-mind-map-engine "dot"))
