(setq org-directory "~/org-roam/")
(setq org-agenda-files (list org-directory))

(setq org-capture-templates
	'(
	  ("t" "To do")
	  ("tw" "To od work" entry (file "~/org-roam/20210510152855-4_todo_input_work.org") "* TODO %?\n %a")
     
	  ("c" "code")
	  ("cl" "code link" entry (file "~/org-roam/20210729133716-7a_programming_notes_general.org") "* %? %a")
	  ("ca" "code annotation" entry (file "~/org-roam/20210729133716-7a_programming_notes_general.org") "* %? %A")))

(global-set-key (kbd "C-c c") 'org-capture)


(use-package org-roam

  :config
  (org-roam-db-autosync-mode))



(use-package websocket)


(use-package org-roam-ui
  :straight
    (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
    :after org-roam
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(setq org-agenda-files '("~/org-roam/"))

(use-package org-brain
  :config

  )

(add-to-list 'load-path "~/.emacs.d/private/org-roam-ui")
(load-library "org-roam-ui")

(general-define-key :map mq-map
                    :prefix "M-q"
                    "f" 'org-roam-node-find
                    "i" 'org-roam-node-insert)

(setq org-roam-capture-templates '(
                                   ("d" "default" plain "%?"
                                    :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                       "#+title: ${title}\n")
                                    :unnarrowed t)
                                   ("c" "code" plain "* %?\t%^g\n#+BEGIN_SRC %^{language}\n%i\n#+END_SRC"
                                    :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                       "#+title: ${title}\n")a
                                    :unnarrowed t
                                    :immediate-finish t)
                                   ;; ("c")
                                   ))

        (add-to-list 'org-capture-templates
                 `("K" "Kill-ring to Current Clocked Task" plain
                   (clock)
                   "%c" :immediate-finish t :empty-lines 1))



(provide 'asdasd-org-mode)
