(defun hotspots ()
  "helm interface to my hotspots, which includes my locations,
org-files and bookmarks"
  (interactive)
  (helm :sources `(((name . "Mail and News")
                    (candidates . (("Mail" . (lambda ()
                                               (if (get-buffer "*mu4e-headers*")
                                                   (progn
                                                     (switch-to-buffer "*mu4e-headers*")
                                                     (delete-other-windows))

                                                 (mu4e))))
                                   ("Calendar" . (lambda ()  (browse-url "https://www.google.com/calendar/render")))
                                   ("RSS" . elfeed)
                                   ("Agenda" . (lambda () (org-agenda "" "w")))))
                    (action . (("Open" . (lambda (x) (funcall x))))))
                   ((name . "My Locations")
                    (candidates . (("master" . "~/Dropbox/org-mode/master.org")
                                   (".emacs.d" . "~/Dropbox/kitchingroup/jmax" )
                                   ("blog" . "~/blogofile-jkitchin.github.com/_blog/blog.org")
                                   ("ese" . "~/Dropbox/books/ese-book/ese.org" )
                                   ("passwords" . "~/Dropbox/org-mode/passwords.org.gpg")
                                   ("Pycse" . "~/Dropbox/books/pycse/pycse.org")
                                   ("references" . "~/Dropbox/bibliography/references.bib")
                                   ("notes" . "~/Dropbox/bibliography/notes.org")
                                   ("journal" . "~/Dropbox/org-mode/journal.org")
                                   ("tasks" . "~/Dropbox/org-mode/tasks.org")))
                    (action . (("Open" . (lambda (x) (find-file x))))))

                   ((name . "My org files")
                    (candidates . ,(f-entries "~/Dropbox/org-mode"))
                    (action . (("Open" . (lambda (x) (find-file x))))))
                   helm-source-recentf
                   helm-source-bookmarks
                   helm-source-bookmark-set)))


