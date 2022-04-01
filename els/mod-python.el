(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  
  ;; (setenv "WORKON_HOME" "")
  (setenv "PYTHONPATH" "C:\\msys64\\usr\\lib\\python3.9\\site-packages")
  (setq elpy-rpc-python-command "python3")
  
  ;; (pyvenv-mode 1)
  )


