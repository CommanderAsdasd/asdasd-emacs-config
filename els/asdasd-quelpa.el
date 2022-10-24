(unless (package-installed-p 'quelpa)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
    (eval-buffer)
    (quelpa-self-upgrade)))



(quelpa
 '(helm-modular-config
   :fetcher git
   :url "git@github.com:CommanderAsdasd/emacs-helm-modular-config.git"))

(quelpa 'smart-mode-line)
(quelpa 'quelpa-use-package)

(use-package 'quelpa-use-package
  :ensure t
  :config (require 'quelpa-use-package))

(quelpa '(helm-modular-config :fetcher git
   :url ""))

(use-package helm-modular-config
  :quelpa (helm-modular-config
   :fetcher git
   :repo ("CommanderAsdasd/emacs-helm-modular-config"))
  )
