(defun asdasd-find-init-file ()
  "open init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defcustom els (expand-file-name "els/" user-emacs-directory)
  "directory where all the elisp files are stored."
  :type 'directory
  :group 'emacs)

;; (setq custom-file (expand-file-name "emacs-custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name els user-emacs-directory))
 
(require 'asdasd-package-straight)
(require 'asdasd-littering)
(require 'asdasd-ux-config)

(asdasd-ux-config-load '("asdasd-init.el"))
(put 'narrow-to-region 'disabled nil)
