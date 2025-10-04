;; (setq org-capture-templates '(("r" "Region to clocked task with SRC block" plain (clock)
   ;; "%?\n#+BEGIN_SRC\n%i\n#+END_SRC")))

(use-package doct
  :bind 
  
  :config
  (setq org-capture-templates
        (doct '(("Clock" :keys "c"
                 :clock t
                 :children
                 ("Code" :keys "c"
                  :template ("* %^{Heading}"
                             ":PROPERTIES:"
                             ":Created: %U"
                             ":END:"
                             "%a"
                             "#+begin_src %^{Language}"
                             "%i"
                             "#+end_src"
                             ))
                 ("Code" :keys "c"
                  :template ("* %^{Heading}"
                             ":PROPERTIES:"
                             ":Created: %U"
                             ":END:"
                             "%a"
                             "#+begin_src %^{Language}"
                             "%i"
                             "#+end_src"
                             )))
                ;; ("Region" :keys "r"
                ;;  :file (lambda () (car (last (directory-files "C:\\zettel_math\\zaettel_math\\journals" t nil nil))))
                ;;  :prepend t
                ;;  :template ("* %{todo-state} %^{Description}"
                ;;             ":PROPERTIES:"
                ;;             ":Created: %U"
                ;;             ":END:"
                ;;             "%a"
                ;;             "%?")
                ;;  :children (("First Child"  :keys "1"
                ;;              :headline   "One"
                ;;              :todo-state "TODO"
                ;;              :hook (lambda () (message "\"First Child\" selected.")))
                ;;             ("Second Child" :keys "2"
                ;;              :headline   "Two"
                ;;              :todo-state "NEXT")
                ;;             ("Third Child"  :keys "3"
                ;;              :headline   "Three"
                ;;              :todo-state "MAYBE")))
                ))))

(global-set-key (kbd "C-c c") 'org-capture)


(use-package code-archive
  )

