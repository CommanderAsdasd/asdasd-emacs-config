(defun asdasd-multifile-wrapper (beg end &optional buffer-arg)
"sends to mutlifile-n depending on ARG"
(interactive (list (region-beginning)
                   (region-end)
                   (when current-prefix-arg (format "*multifile-%s" (string current-prefix-arg)))))
(mf/mirror-region-in-multifile beg end buffer-arg))

(use-package multifiles
  :straight (multifiles :host github :repo "magnars/multifiles.el")
  :config 
  :bind ("C-c n" . mf/mirror-region-in-multifile))

(use-package mirror-text
  :after (quelpa quelpa-use-package)
  :straight (mirror-text :host github :repo "yantar92/mirror-text")
  )
