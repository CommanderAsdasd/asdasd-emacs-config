(defun asdasd-os-clipboard-howm-exchanger-save (candidate)
  "workaround for a broken clipboard - save on focus off"
  ;; (interactive)
  (write-region (if candidate candidate (car kill-ring)) nil (expand-file-name "clipboard" howm-directory))
  (message "saved to clipboard file"))

(defun asdasd-os-clipboard-howm-exchanger-save-last-kill-ring ()
  "workaround for a broken clipboard - save on focus off"
  (interactive)
  (asdasd-os-clipboard-howm-exchanger-save (car kill-ring)))


(defun asdasd-os-clipboard-howm-exchanger-load ()
  "workaround for a broken clipboard - load on focus on"
  (interactive)
  (with-temp-buffer
    (insert-file-contents (expand-file-name "clipboard" howm-directory))
    (kill-new (buffer-string)))
  (message "loaded from clipboard file"))

;; glicthy, manual run is better
;; (add-hook 'focus-out-hook 'asdasd-os-clipboard-howm-exchanger-save)
;; (add-hook 'focus-in-hook 'asdasd-os-clipboard-howm-exchanger-load)

(defun asdasd-os-clipboard-howm-save-path-for-find-file ()
  "write to sync file path witch other instance needs to open"
  (interactive)
  (write-region buffer-file-truename nil (expand-file-name "find-file-sync" howm-directory))
  (message "saved to find-file-sync file"))

(defun asdasd-os-clipboard-howm-load-path-for-find-file ()
  "open path from sync file"
  ;; (interactive)
  (interactive)
  (with-temp-buffer
    (insert-file-contents (expand-file-name "find-file-sync" howm-directory))
    (find-file (buffer-string)))
  (message "loaded path from find-file-sync file"))

(use-package emacs
  :bind ("M-s c s" . asdasd-os-clipboard-howm-exchanger-save-last-kill-ring)
  ("M-s c l" . asdasd-os-clipboard-howm-exchanger-load))

(use-package clipmon
  :bind* ("M-s c m" . clipmon-autoinsert-toggle)
  (:map embark-kill-ring-map
        ("c" . asdasd-os-clipboard-howm-exchanger-save))
  :config (clipmon-mode))

(use-package ox-clip)
