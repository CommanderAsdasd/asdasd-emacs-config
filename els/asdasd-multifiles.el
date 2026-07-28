(defun asdasd-multifiles-select-buffer-wrapper (beg end &optional buffer-arg)
  "sends region to *mutlifile-ARG* depending on ARG"
  (interactive (list (region-beginning)
                     (region-end)
                     (when current-prefix-arg (format "*multifile-%s" (prefix-numeric-value current-prefix-arg))))))

(defun asdasd-multifile-mirror-file (file)
  "inserts FILE into multifile buffer"
  (save-window-excursion
    (find-file file)
    (mf/mirror-region-in-multifile (point-min) (point-max))))

(defun asdasd-multifile-mirror-src-block-contents (candidate)
  (message candidate)
  ;; (mf/mirror-region-in-multifile (nth 0 (org-src--contents-area (org-element-at-point))) (nth 1 (org-src--contents-area (org-element-at-point))))
  )

(use-package multifiles
  :straight (multifiles :host github :repo "magnars/multifiles.el")
  :config 
  :bind (:map embark-org-src-block-map
              ("m" . asdasd-multifile-mirror-src-block-contents))
  ;; ("C-c n" . mf/mirror-region-in-multifile)
  )

(use-package mirror-text
  :after (quelpa quelpa-use-package)
  :straight (mirror-text :host github :repo "yantar92/mirror-text")
  )

(use-package chunk-edit
  :straight (mirror-text :host github :repo "vkazanov/chunk-edit")
  :bind
  ;; (("C-c n" . chunk-edit-insert-region)
  ;;        :map embark-org-src-block-map
  ;;        ("m" . (lambda () (interactive)                                                (chunk-edit-insert-region))))
  )

(provide 'asdasd-multifiles)
