;; -*- lexical-binding: t -*-
;; (use-package mpv
;;   :config )

(require 'asdasd-os-path)

(defcustom asdasd-ux-media-random-tracks-dir "f:/Rack_tracks/rack tracks 1-5 minutes/" "dir to play")
(defcustom asdasd-ux-media-vlc-dir "e:/Program Files/VideoLAN/VLC/" "vlc dir")
(defcustom asdasd-ux-media-yt-dlp-program "c:/Users/asdasd/Downloads/yt-dlp(1).exe" "yt-dlp path")
(defcustom asdasd-ux-media-vlc-playlist '() "list to play in vlc")


(defun asdasd-ux-media-youtube-download (url)
  (interactive "Murl: ")
  (start-process "youtube download" "youtube download" asdasd-ux-media-yt-dlp-program url))

(cl-defun asdasd-ux-media-play-random-tracks-from-dir (arg &optional (count 100))
  ""
  (interactive "P")
  (let ((default-directory (if arg (expand-file-name (read-directory-name "Play from dir:")) asdasd-ux-media-random-tracks-dir)))
    (asdasd-os-path-add-to-path asdasd-ux-media-vlc-dir)
    (asdasd-os-path-add-to-path "c:/msys64/usr/bin/")
    (view-buffer-other-window (process-buffer (start-process-shell-command (compile-time-function-name) (compile-time-function-name) "ls *wav | sort -R| head -n 100 | xargs vlc --playlist-enqueue ")))))

(cl-defun asdasd-ux-media-play-random-zoom-tracks (arg &optional (count 100))
  ""
  (interactive "P")
  (asdasd-os-path-add-to-path asdasd-ux-media-vlc-dir)
    (asdasd-os-path-add-to-path "c:/msys64/usr/bin/")
    (view-buffer-other-window (process-buffer (start-process-shell-command (compile-time-function-name) (compile-time-function-name) "es \.wav | grep zoom | sort -R| head -n 100 | tr '\n' ' ' | xargs -0 -I {} vlc {}"))))

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

(defun asdasd-ux-media-play-list-in-vlc ()
  (interactive)
  (start-process-shell-command (compile-time-function-name)
                               (asdasd-emacs-api-special-buffer-function-name (compile-time-function-name))
                               (format "vlc --playlist-enqueue %s" (c-concat-separated asdasd-ux-media-vlc-playlist " "))))

;; 

(defun asdasd-ux-media-embark-add-to-vlc-playlist (file)
  (push (concat "\"" (asdasd-os-path-windize file) "\"") asdasd-ux-media-vlc-playlist))

(defun asdasd-ux-media-vlc-playlist-make-empty ()
  (interactive)
  (customize-set-variable 'asdasd-ux-media-vlc-playlist '()))


(defun my-action-ch (key)
  "Single-key action chooser."
  )


(defun asdasd-ux-media-embark-ffmpeg-convert-to-format (object)
  ""
  (let ((key (list (read-char-choice
          "Action: mp[3], mp[4], [q]uit: "
          '(?3 ?4 ?q)))))
    (pcase key
    (?3 (asdasd-ux-media-embark-ffmpeg-convert-to-mp3 object))
    (?4 (asdasd-ux-media-embark-ffmpeg-convert-to-mp4 object))
    (?q (message "Quitting…"))))
  )

(defun asdasd-ux-media-embark-ffmpeg-convert-to-mp3 (object)
  ""
  (start-process-shell-command (concat "*" (compile-time-function-name) "*") (concat "*" (compile-time-function-name) "*")
                               (format "ffmpeg -i '%s' '%s.mp3'" (expand-file-name object) (expand-file-name object))))

(defun asdasd-ux-media-ffmpeg-convert-to-mp4 (object)
  ""
  (start-process-shell-command (concat "*" (compile-time-function-name) "*") (concat "*" (compile-time-function-name) "*")
                               (format "ffmpeg -i '%s' '%s.mp4'" (expand-file-name object) (expand-file-name object))))

;; (use-package embark
;;   :bind
;;   )

(use-package tracker-mode
  :straight (:host github :repo "defaultxr/tracker-mode"))

(use-package emms)

(use-package osc
  :config )

(provide 'asdasd-ux-media)
