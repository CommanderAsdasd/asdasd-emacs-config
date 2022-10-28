;; load asdasd-general
(modular-config-load-modules '(asdasd-general))

(setq evil-disable-insert-state-bindings t)
(use-package evil
  ;; :general 
  :custom
  (evil-disable-insert-state-bindings t)
  (evil-mode)
  (evil-cross-lines t)
  :straight t
  :config
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (evil-define-key '(normal motion) evil-window-map (kbd "u") 'winner-undo) 
  (evil-define-key '(normal motion) evil-window-map (kbd "U") 'winner-redo)
  (evil-define-key 'normal shell-mode-map (kbd "<Enter>") 'comint-send-input)
  (evil-define-key 'normal fundamental-mode-map (kbd "gs") '(lambda () (interactive) (async-shell-command "explorer .")))

  (evil-mode))

;; use-package bind key example

;; disable insert state bindings
;; (setq evil-disable-insert-state-bindings t)
