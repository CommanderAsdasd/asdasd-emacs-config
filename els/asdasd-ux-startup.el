(use-package emacs
  :custom (inhibit-startup-screen t)
  :config 
  (add-hook 'emacs-startup-hook #'howm-menu))
