(setq package-enable-at-startup nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(require 'package)

  ;; (unless (use-package 'el-get nil 'noerror)

    (add-to-list 'package-archives
		 '("melpa" . "https://melpa.org/packages/") t)
    (package-refresh-contents)
(package-initialize)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
    ;; (package-install 'el-get)
    ;; )

  (unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(provide 'asdasd-packaging-startup)
