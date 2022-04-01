; Upon drag-and-drop to a frame (OSX window): Find the file in the frame,
;   with shift: insert filename(s), space-separated;
;   with control: insert filename(s) as lines, repeating the beginning of the line;
;   with meta: insert file contents
                                        ; note that the emacs window must be activated (CMD-TAB) for the modifiers to register
;; <S-drag-n-drop>
(define-key global-map [M-drag-n-drop] 'ns-insert-file)
(define-key global-map [S-ns-drag-file] 'ns-insert-filename)
(define-key global-map [C-ns-drag-file] 'ns-insert-filename-as-lines)
(define-key global-map [drag-n-drop] 'ns-find-file-in-frame)

(defun ns-insert-filename ()
  "Insert contents of first element of `ns-input-file' at point."
  (interactive)
  (let ((f (pop ns-input-file)))
    (insert f))
  (if ns-input-file                     ; any more? Separate by " "
      (insert " ")))

(defun ns-insert-filename-as-lines ()
  "Insert contents of first element of `ns-input-file' at point,
as lines repeating any text already on the line before point.."
  (interactive)
  (let ((bols (buffer-substring (line-beginning-position) (point))))
    (let ((f (pop ns-input-file)))
      (insert f)
      (insert "\n")
      (if ns-input-file                     ; any more? Insert bols again
          (insert bols)))))

(defun ns-find-file-in-frame ()
  "Do a `find-file' with the `ns-input-file' as argument; staying in frame."
  (interactive)
  (let ((ns-pop-up-frames nil))
    (ns-find-file)))

(use-package bookmark-view
  :ensure t)

(use-package workgroups2)

(require 'asdasd-ux-keys)
(provide 'asdasd-ux)
