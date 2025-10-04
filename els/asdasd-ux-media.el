;; -*- lexical-binding: t -*-
;; (use-package mpv
;;   :config )

(require 'asdasd-os-path)

(defcustom asdasd-ux-media-random-tracks-dir "f:/Rack_tracks/rack tracks 1-5 minutes/" "dir to play")
(defcustom asdasd-ux-media-vlc-dir "e:/Program Files/VideoLAN/VLC/" "vlc dir")
(defcustom asdasd-ux-media-yt-dlp-program "c:/Users/asdasd/Downloads/yt-dlp(1).exe" "yt-dlp path")


(defun asdasd-ux-media-youtube-download (url)
  (interactive "Murl: ")
  (start-process "youtube download" "youtube download" asdasd-ux-media-yt-dlp-program url))

(cl-defun asdasd-ux-media-play-random-tracks-from-dir (arg &optional (count 100))
  ""
  (interactive "P")
  (let ((default-directory (if arg (read-directory-name "Play from dir:") asdasd-ux-media-random-tracks-dir)))
    (asdasd-os-path-add-to-path asdasd-ux-media-vlc-dir)
    (start-process-shell-command "random rack tracks" "random rack tracks" "ls ./*wav | sort -R | head -n 100 | xargs vlc")))


(cl-defun asdasd-ux-media-encode-rack-track (input-track &optional default-directory-new)
  ""
  (interactive ((lambda (x) (if default-directory-new (setq-local default-directory default-directory-new) (setq-local default-directory asdasd-ux-media-random-tracks-folder)))
                (lambda (x) (read-file-name "Input track:"))))
  (let
      ()
    (start-process-shell-command "encode ranck track" "*encode ranck track*"
                                 (format "ffmpeg -i '%s' -codec copy -write_id3v2 1 -metadata 'artist=%s' -metadata 'album=%s' '%s'"
                                         (read-string "Artist:" "Precautionary Wizard")
                                         (read-string "Track name:")
                                         (read-file-name "Output file:" nil nil nil)))))


(use-package tracker-mode
  :straight (:host github :repo "defaultxr/tracker-mode"))



(use-package emms)

(use-package osc
  :config )

(provide 'asdasd-ux-media)
