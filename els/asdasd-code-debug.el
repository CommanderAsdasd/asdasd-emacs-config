(use-package dap-mode
  :custom (dap-python-debugger 'debugpy)  ;; https://github.com/emacs-lsp/dap-mode/issues/306
  :config
  (require 'dap-python)
  (dap-register-debug-template "My App"
  (list :type "python"
        :args "-i"
        :cwd nil
        :env '(("DEBUG" . "1"))
        :target-module (expand-file-name "~/src/myapp/.env/bin/myapp")
        :request "launch"
        :name "My App")))

