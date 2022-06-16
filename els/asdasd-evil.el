(use-package evil
  :config (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-w u") 'evil-prev-buffer)
(define-key evil-normal-state-map (kbd "C-w d") 'evil-next-buffer)
(define-key evil-motion-state-map (kbd "C-w u") 'evil-prev-buffer)
(define-key evil-motion-state-map (kbd "C-w d") 'evil-next-buffer)
(setq evil-disable-insert-state-bindings t)
;; (setq evil-emacs-state-modes nil)
;; (setq evil-insert-state-modes nil)
;; (setq evil-motion-state-modes nil)
(evil-mode)
)





(setq evil-want-fine-undo t)
(use-package evil-collection
  :preface (setq evil-want-keybinding nil)
  :custom (evil-collection-setup-minibuffer t)
  :config (evil-collection-init))


;; (use-package evil-dired)
