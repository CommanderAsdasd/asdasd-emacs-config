
(use-package doct
  :ensure t
  :config (setq org-capture-templates ))

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda #1="")
          (alltodo #1#)))
        ("c" . "My Custom Agendas")
        ("cu" "Unscheduled TODO"
         ((todo ""
                ((org-agenda-overriding-header "\nUnscheduled TODO")
                 (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled)))))
         nil
         nil))
)


(setq org-agenda-files '("c:/org-roam/"))
(setq org-roam-directory "c:/org-roam/")


(setq org-capture-templates
      '(("t" "Todo" entry (file "c:/msys64/home/asdasd/org-roam/20210828122253-programming_links.org") 
         "** TODO %?\n %i\n")
        ("l" "Link")
        ;; '(setq-local $link-template "* %i %? %l")
        ("le" "elisp" entry (file+headine "c:/msys64/home/asdasd/org-roam/20210828122253-programming_links.org" "elisp") "* %i %? %l") 
        ("lf" "file link" entry (file+headine "c:/msys64/home/asdasd/org-roam/20210828122253-programming_links.org" "files") "* %i %? %l")
        ("lc" "cpp" entry (file+headline  "c:/msys64/home/asdasd/org-roam/20210828122253-programming_links.org" "cpp") "* %i %? %l")
        ))

(doct '("link" :keys "l"
        :file ""
        :children ("elisp" :keys "e")))

(defun asdasd-org-capture-cpp ()
  "copies cpp links non-intercatively"
  (interactive)
  (org-capture t "lc")
  )



(defun asdasd-org-capture-file-link ()
  "copies cpp links non-intercatively"
  (interactive)
  (org-capture nil "lf")
  )

(global-set-key (kbd "C-c c") 'org-capture)         
(global-set-key (kbd "C-c C-l") 'org-store-link)    
(global-set-key (kbd "C-c l") 'org-insert-link)
(general-define-key
 :prefix "M-q"
 "f" 'org-roam-node-find                   
 "c c" 'asdasd-org-capture-cpp
 "c f" 'asdasd-org-capture-file-link)

(use-package org-pdftools
  :ensure t
  :hook (org-mode . org-pdftools-setup-link))


(org-babel-do-load-languages 'org-babel-load-languages    '(        (shell . t)    ))
(setq org-src-tab-acts-natively t)


;; (setq
;;  org-structure-template-alist '(("a" . "export ascii")
;;  ("c" . "center")
;;  ("C" . "comment")
;;  ("e" . "example")
;;  ("E" . "export")
;;  ("h" . "export html")
;;  ("l" . "export latex")
;;  ("q" . "quote")
;;  ("s" . "src")
;;  ("v" . "verse")
;;  ("m" . "src bash :dir /plink:192.168.56.124:/ :results verbatim")))


(use-package org-randomnote
  :ensure t
  :bind ("M-q r o" . org-randomnote))

(defvar outline-minor-mode-prefix "\M-#")

(provide 'asdasd-notes-org)
