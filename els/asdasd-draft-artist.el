(let ((buffer (get-buffer-create "graphics")))
  (with-current-buffer buffer 
  (artist-mode)
  (artist-clear-buffer (get-buffer-create buffer))
  (dotimes (x 159) (artist-draw-line (random 10) (random 10) (random 51) (random 21)))
  ;;op (artist-key-set-point)
  ))
