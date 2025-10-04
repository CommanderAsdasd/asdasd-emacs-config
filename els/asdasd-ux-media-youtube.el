;; Pure Emacs solution: fetch title via YouTube oEmbed
(require 'url)
(require 'json)

(defun asdasd-ux-media-youtube-video-title (url)
  "Return the title of the YouTube video at URL using oEmbed JSON."
  (let* ((api (format "https://www.youtube.com/oembed?url=%s&format=json"
                      (url-hexify-string url)))
         (buf (url-retrieve-synchronously api t t 10.0)))
    (unless buf (error "Failed to retrieve oEmbed for %s" url))
    (unwind-protect
        (with-current-buffer buf
          (goto-char (point-min))
          (unless (re-search-forward "\n\n" nil t)
            (error "Bad HTTP response"))
          (let ((json-object-type 'alist)
                (json-array-type 'list)
                (json-key-type 'symbol))
            (alist-get 'title (json-read))))
      (when (buffer-live-p buf) (kill-buffer buf)))))

;; Optional interactive helper that shows it in the minibuffer
(defun asdasd-ux-media-youtube-video-title-echo (url)
  "Prompt for a YouTube URL and echo its title."
  (interactive "sYouTube URL: ")
  (message "%s" (asdasd-ux-media-youtube-video-title url)))

(defun asdasd-ux-media-youtube-video-title-make-org-link ()
  (interactive)
  (let* ((url (buffer-substring-no-properties (region-beginning) (region-end)))
         (title (asdasd-ux-media-youtube-video-title url))
         (link (org-link-make-string url title)))
    (delete-region (region-beginning) (region-end))
    (insert link)
    ))
