;; load asdasd-general
(asdasd-ux-config-load '("asdasd-general.el"))

(setq evil-disable-insert-state-bindings t)

(use-package evil
  ;; :general 
  :custom
  (evil-disable-insert-state-bindings t)
  (evil-mode)
  (evil-cross-lines t)
  (evil-normal-state-modes '(fundamental-mode))
  :straight t
  :config
  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
  (evil-define-key '(normal motion) evil-window-map (kbd "u") 'winner-undo) 
  (evil-define-key '(normal motion) evil-window-map (kbd "U") 'winner-redo)
  (evil-define-key 'normal shell-mode-map (kbd "<Enter>") 'comint-send-input)
  (evil-define-key 'normal fundamental-mode-map (kbd "gs") '(lambda () (interactive) (async-shell-command "explorer .")))
  (define-key evil-motion-state-map (kbd "g c") #'evil-avy-goto-char)
  (define-key evil-motion-state-map (kbd "g W") #'evil-avy-goto-word-1)
  ;; define evil map for previous and next buffer

;; map to capital H slide buffer left in evil normal mode
(evil-define-key nil evil-window-map (kbd "H") 'slide-buffer-left)

;; same for JKL
(evil-define-key nil evil-window-map (kbd "J") 'slide-buffer-down)
(evil-define-key nil evil-window-map (kbd "K") 'slide-buffer-up)
(evil-define-key nil evil-window-map (kbd "L") 'slide-buffer-right)

(define-prefix-command 'buffer-swticher-map)
;; (define-key evil-window-map (kbd "[") 'previous-buffer)
;; (define-key evil-window-map (kbd "]") 'next-buffer)
;; use-package bind repeatable key:
(general-define-key
 :keymaps 'evil-window-map
 "[" '(previous-buffer :repeat t)
 "]" '(next-buffer :repeat t))


  (evil-mode))


(use-package evil-collection)

;; use-package bind key example

;; disable insert state bindings
;; (setq evil-disable-insert-state-bindings t)
