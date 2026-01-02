(use-package bm)

(use-package bm-ext
  :after bm)

;; (use-package bookmark+)

(defun my-bookmark-url-handler (bookmark)
  (browse-url (bookmark-prop-get bookmark 'url)))

(defun asdasd-bookmark-make-url (url name)
  (interactive "MUrl: \nMName: ")
  (bookmark-store
     name
     `((handler . my-bookmark-url-handler)
       (url . ,url))
     nil))

;; (defun asdasd-bookmark-url (url name)
  
;;   (asdasd-bookmark-make-url url name)
;;   )

(asdasd-bookmark-make-url "https://github.tools.sap/hyperspace-act/act-e2e" "act-e2e")
(asdasd-bookmark-make-url "https://github.tools.sap/hyperspace-act/act-infra" "act-infra")
(asdasd-bookmark-make-url "https://github.tools.sap/hyperspace/hyper-cluster/" "hyper-cluster")
(asdasd-bookmark-make-url "https://github.tools.sap/hyperspace/" "hyperspace org")

