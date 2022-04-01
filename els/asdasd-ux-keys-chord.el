;; (defun asdasd/)

(defun asdasd/ace-jump-paren ()
  (interactive)
  (call-interactively 'ace-jump-char-mode t))


(use-package key-chord
  :ensure t
  :config
  (setq key-chord-two-keys-delay 0.5)
(key-chord-mode 1)
  (key-chord-define-global "uu" 'undo)
  (key-chord-define-global "ww" 'ace-window)
  (key-chord-define-global "`1" 'asdasd/ace-jump-paren)
  (key-chord-define-global "qq" '"\C-g")
  (key-chord-define-global "xx" 'helm-M-x) ;;execute-extended-command
  ;; (key-chord-define-global "ee" 'eval-last-sexp)
  (key-chord-define prog-mode-map ";;" 'comment-line)
  (key-chord-define evil-insert-state-map "kj" 'evil-normal-state))


(provide 'asdasd-ux-keys-chord)
