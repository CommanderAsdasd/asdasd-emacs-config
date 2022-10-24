;; (use-package evil-adjust
;;   :ensure t)

(modular-config-load-modules '(asdasd-config-keys) )

(use-package evil
  :config (evil-mode)
(define-key evil-motion-state-map (kbd "gl") 'ace-link)
(define-key evil-motion-state-map (kbd "gw") 'ace-jump-word-mode) ;;
(define-key evil-normal-state-map (kbd "gw") 'ace-jump-word-mode) ;;
(define-key evil-normal-state-map (kbd "gW") 'ace-window)
(define-key evil-motion-state-map (kbd "gW") 'ace-window);; (evil-global-set-key 'insert "C-c" 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-emacs-state-map (kbd "h") 'self-insert-command)
(define-key evil-emacs-state-map (kbd "j") 'self-insert-command)
(define-key evil-emacs-state-map (kbd "k") 'self-insert-command)
(define-key evil-emacs-state-map (kbd "l") 'self-insert-command)
;; (define-key evil--state-map (kbd "l") 'self-insert-command)
(add-hook 'shell-mode-hook
          (lambda ()
            (evil-local-set-key 'normal (kbd "<return>") 'comint-send-input)))
;; (evil-define-key 'normal  KEY DEF &rest BINDINGS)
;; (evil-global-set-key '(normal motion) "gw" 'ace-jump-word-mode)
)
(use-package evil-collection)

(use-package evil-traces)

(setq evil-want-fine-undo 'fine)

;; 
(modular-config-load-modules '(asdasd-evil-leader) )

(provide 'asdasd-evil)
