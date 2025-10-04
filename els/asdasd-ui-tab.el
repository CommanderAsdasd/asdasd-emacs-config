(use-package tab-bar
  :preface (defun tab-bar-new-tab-named () "create and rename" (interactive) (tab-duplicate) (call-interactively 'tab-rename))
  :bind ("C-x t R" . 'tab-bar-new-tab-named
         ))
