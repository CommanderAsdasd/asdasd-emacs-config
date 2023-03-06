(use-package multifiles
  :straight (multifiles :host github :repo "https://github.com/magnars/multifiles.el")
  :bind ("C-c n" . mf/mirror-region-in-multifile))

(use-package mirror-text
  :after (quelpa quelpa-use-package)
  :straight nil
  :quelpa  (mirror-text :fetcher github :repo "yantar92/mirror-text"))
