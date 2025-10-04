(defun asdasd-ux-buffer-get-current-buffer-process (args)
  ""
  (interactive "P")
  (princ (get-buffer-process (current-buffer))))

(defun asdasd-ux-buffer-copy-as-kill ()
  "copy current buffer"
  (interactive)
  (copy-region-as-kill (point-min) (point-max)))

(defun asdasd-ux-buffer-new-scratch (mode)
  "create scratch of MODE"
  (interactive (list (completing-read "Mode:" (mapcar 'cdr auto-mode-alist))))
  (let ((new-scratch-buffer (generate-new-buffer (format "*scratch-%s*" mode))))
    (with-current-buffer new-scratch-buffer
      (switch-to-buffer new-scratch-buffer)
      (funcall (intern mode)))))

(defun asdasd-ux-buffer-switch-to-buffer-type (prompt initial)
  "interface for generic buffer initial prompt"
  (interactive)
  (consult--multi consult-buffer-sources
                :require-match
                (confirm-nonexistent-file-or-buffer)
                :prompt prompt
                :initial initial
                :history 'consult--buffer-history
                :sort nil))

(defun asdasd-ux-buffer-switch-to-scratch ()
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Scratch buffer: " "*scratch "))


(defun asdasd-ux-buffer-switch-to-indirect ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Indirect buffer: " "::\\|I- "))

(defun asdasd-ux-buffer-switch-to-async-shell-command ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Async shell command buffer: " "* .shell* "))

(defun asdasd-ux-buffer-switch-to-embark ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Embark buffer: " "*embark "))

(defun asdasd-ux-buffer-switch-to-opened-config ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Config buffer: " "^asdasd "))

(defun asdasd-ux-buffer-switch-to-org ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Org buffer:" "\\\.org "))

(defun asdasd-ux-buffer-switch-to-org-src ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Org src buffer:" "Org Src "))

(defun asdasd-ux-buffer-switch-to-special ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Special buffers:" "^*"))

(defun asdasd-ux-buffer-switch-to-same-file-type ()
  ""
  (interactive)
  (asdasd-ux-buffer-switch-to-buffer-type "Special buffers:" (concat "." (file-name-extension (buffer-file-name)))))

(use-package emacs
  :custom (confirm-kill-processes nil)
  (use-short-answers t)
  :bind*
  ("C-x m" . (lambda () (interactive) (switch-to-buffer-other-window "*Messages*")))
  ("C-x b" . kill-buffer)
  ("C-x k k" . switch-to-buffer)
  ("C-x k K" . switch-to-buffer-other-window)
  ("C-x k s" . asdasd-ux-buffer-switch-to-scratch)
  ("C-x k a" . asdasd-ux-buffer-switch-to-async-shell-command)
  ("C-x k S" . asdasd-ux-buffer-new-scratch)
  ("C-x k i" . asdasd-ux-buffer-switch-to-indirect)
  ("C-x k e" . asdasd-ux-buffer-switch-to-embark)
  ("C-x k m" . asdasd-ux-buffer-switch-to-opened-config)
  ("C-x k o" . asdasd-ux-buffer-switch-to-org)
  ("C-x k O" . asdasd-ux-buffer-switch-to-org-src)
  ("C-x k p" . consult-project-buffer)
  ("C-x k *" . asdasd-ux-buffer-switch-to-special)
  ("C-x k f" . asdasd-ux-buffer-switch-to-same-file-type))

;; (global-set-key (kbd "C-x H") 'previous-buffer)
;; (global-set-key (kbd "C-x L") 'next-buffer)
(use-package cbm
  :config )

;; (use-package persp-mode
;;   :config (persp-mode))


(use-package eyebrowse)

(provide 'asdasd-ux-buffer)
