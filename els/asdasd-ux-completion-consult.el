(use-package compat
  :straight (compat :host github :repo "emacs-compat/compat"))

(use-package orderless)

;; consult - completing-read replacements

(use-package consult
  ;; :config ;; (defun asdasd-vertico-consult-hide-comments ()
  ;;    (consult-focus-lines (concat "" )))
  :custom (consult-preview-key "M-.")
  (switch-to-buffer-in-dedicated-window t)
  :bind*
  ("C-x k d" . consult-dir)
  ("C-x C-{" . consult-complex-command)
  ("C-c o w" . consult-org-heading)
  ("M-s c o" . consult-outline)
  ("M-s c f" . consult-focus-lines)
  ("M-s c k" . consult-keep-lines)
  ("C-c r c" . consult-ripgrep)
  ("C-c r r" . ripgrep-regexp)
  ;; ("M-s s" . isearch-forward)
  ;; ("M-s r" . isearch-backward)
  ("C-s i" . isearch-forward)
  ("C-s r" . isearch-forward-regexp)
  ("C-s k" . consult-line)
  ("C-s K" . consult-line-multi)
  ("M-y" . consult-yank-from-kill-ring)
  ("M-z" . consult-yank-from-kill-ring)
  ("C-z" . yank)
  ("M-S-y" . consult-yank-pop)
  ("C-x C-b" . consult-recent-file)
  ("C-x r l" . consult-bookmark)
  ("C-h i" . consult-info)
  ("C-x c m" . consult-mark)
  ("C-x c M" . consult-global-mark)
  (:map comint-mode-map 
  ("M-r" . consult-history))
  (:map minibuffer-local-map
  ("M-r" . consult-history)
  ("M-R" . previous-matching-history-element))

  :config
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   :preview-key "M-.")
  :custom (orderless-component-separator 'orderless-escapable-split-on-space))

(use-package consult-everything
  :straight (:no-byte-compile t :host github :repo "jthaman/consult-everything")
  :config (advice-add 'consult-everything :around #'asdasd-ux-advice-vertico-sort-alpha)
  :bind*
  ("C-c r e" . consult-everything))



(use-package consult-dir
  :config )

(provide 'asdasd-ux-completion-consult)
