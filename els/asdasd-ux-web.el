(require 'cl-lib)

(defun asdasd-ux-web-search-gmail (search-string)
  (interactive "M")
  (browse-url (concat "https://mail.google.com/mail/u/0/#search/" search-string)))

(defun asdasd-ux-web-yt-dlp-download-video (url)
  (interactive "MUrl:")
  (start-process-shell-command "yt-dlp download" "yt-dlp download" (concat "d:/yt-dlp.exe " url)))

(defun asdasd-ux-web-browse-random-glsl-sandbox-page ()
  "Browses a random GLSL Sandbox page."
  (interactive)
  ;; Generate a random ID within the expected range
  (let* ((min-id 0)
         (max-id 189999)
         (random-id (+ min-id (random (- max-id min-id)))))
    ;; Construct the URL
    (let ((url (format "https://glslsandbox.com/e#%d.0" random-id)))
      ;; Browse the URL
      (browse-url url))))

(use-package websearch
  :config )


(use-package enlive
  :straigh t)

(use-package leetcode
  :config )


(use-package google-translate
  :config )
;; (use-package github-explorer
;;   :config )

(use-package mermaid-mode
  :config )
