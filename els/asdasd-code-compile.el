;;
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)

(use-package ansi-color
    :hook (compilation-filter . ansi-color-compilation-filter)) 

