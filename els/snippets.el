;; * yas

(use-package yasnippet
  :ensure t
  :config
  (yas-minor-mode-on)
  (global-set-key (kbd "C-S-s") 'yas/insert-snippet)
  (general-define-key "M-q y" yas-minor-mode-map))


(use-package yasnippet-snippets
  :after yasnippet)

