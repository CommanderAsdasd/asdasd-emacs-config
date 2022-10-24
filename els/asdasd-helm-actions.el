
;; window-list
(defun window-list (&optional frame)
  "Return a list of windows on FRAME (default: selected frame)."
  (window-list-1 (frame-root-window) 'window-list))


