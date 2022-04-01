()

(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.1)
  (key-chord-mode 1)
  (key-chord-define-global "qq"  '"\C-g")
  (key-chord-define-global "xx"  'helm-M-x) ;;execute-extended-command
  (key-chord-define-global "es" 'eval-last-sexp)
  (key-chord-define prog-mode-map ";;" 'comment-line)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state)
  )


