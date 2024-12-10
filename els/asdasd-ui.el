
(use-package warnings
  :config (add-to-list 'display-buffer-alist
                       
                       '("\\*Warning\\*" ;; Adjust the buffer name pattern to match your warning buffer's name
                         (display-buffer-reuse-window display-buffer-in-background)
                         (reusable-frames . 0))))


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)


