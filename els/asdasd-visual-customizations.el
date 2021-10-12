(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-face-attribute 'lazy-highlight nil :foreground "black" :background "green" :weight 'bold)

(use-package highlight-symbol
  :ensure t
  :init
  (progn (global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)))


(rainbow-delimiters-mode t) 

(use-package ace-link
  :ensure t
  :defer)

(use-package ace-jump-mode
  :after ace-link
  :ensure t)





(provide 'asdasd-visual-customizations)
