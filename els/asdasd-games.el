(use-package speed-type)

(use-package tetris
  :bind (:map tetris-mode-map
              ("k" . tetris-move-left)
              ("'" . tetris-move-right)
              ("o" . tetris-rotate-next)
              ("p" . tetris-rotate-prev)
              ("l" . tetris-move-down)))
