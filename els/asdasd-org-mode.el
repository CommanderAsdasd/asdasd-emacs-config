(setq org-directory "/home/atankovskii/git/org-roam/")
(setq org-agenda-files (list org-directory))

(setq org-capture-templates
	'(
	  ("t" "To do")
	  ("tw" "To od work" entry (file "/home/atankovskii/org-roam/20210510152855-4_todo_input_work.org") "* TODO %?\n %a")
     
	  ("c" "code")
	  ("cl" "code link"entry (file "/home/atankovskii/org-roam/20210729133716-7a_programming_notes_general.org") "* %? %a")
	  ("ca" "code annotation" entry (file "/home/atankovskii/org-roam/20210729133716-7a_programming_notes_general.org") "* %? %A")))

(provide 'asdasd-org-mode)
