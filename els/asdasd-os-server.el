(use-package server
  :custom ()
  :init (require 'server)
  (when (and (>= emacs-major-version 23)
             (equal window-system 'w32))
    (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
                                        ; ~/.emacs.d/server is unsafe"
                                        ; on windows.
  (server-start)
  :config (server-start))
