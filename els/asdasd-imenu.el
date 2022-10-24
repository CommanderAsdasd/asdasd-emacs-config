(use-package imenu-list)

(progn (setq imenu-list-focus-after-activation t)
       (setq imenu-list-auto-resize t)
       (setq imenu-list-size 0.3)
       (setq imenu-list-position 'left)
       (setq imenu-list-major-mode-column-width 0)
       (setq imenu-list-after-jump-hook '(imenu-list-update)))

(s
