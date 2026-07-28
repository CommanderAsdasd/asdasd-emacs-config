(require 'asdasd-ux-advice)

(use-package compat
  :straight (compat :host github :repo "emacs-compat/compat"))

(use-package orderless)

;; consult - completing-read replacements

()

(use-package consult
  ;; :config ;; (defun asdasd-vertico-consult-hide-comments ()
          ;;    (consult-focus-lines (concat "" )))
  :custom
  (switch-to-buffer-in-dedicated-window t)
  (isearch-pre-move-point t)
  :bind*
  ("C-x k d" . consult-dir)
  ("C-x C-{" . consult-complex-command)
  ("C-c o w" . consult-org-heading)
  ("M-s c o" . consult-outline)
  ("M-s c f" . consult-focus-lines)
  ("M-s c k" . consult-keep-lines)
  ("C-c r c" . consult-ripgrep)
  ("C-c r r" . ripgrep-regexp)
  ("C-s i" . isearch-forward)
  ("C-s I" . isearch-backward)
  ("C-s r" . isearch-forward-regexp)
  ("C-s k" . consult-line)
  ("C-s K" . consult-line-multi)
  ;; ("C-S-s" . isearch-forward-regexp)
  ("M-s M-s" . consult-line)
  ("M-y" . consult-yank-from-kill-ring)
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
   :preview-key "C-,")
  :custom (orderless-component-separator 'orderless-escapable-split-on-space)
  (consult-preview-key "M-,"))


(use-package consult-everything
  :straight (:no-byte-compile t :host github :repo "jthaman/consult-everything")
  :bind*
  ("C-c r e" . consult-everything))


(use-package consult-dir
  :config )

(defun asdasd-ux-completion-consult-notest-nomock ()
  "filter go results"
  (interactive)
  (consult-focus-lines #[514 "\300\301\302$\207" [consult--completion-filter-dispatch consult-location nil] 7 ("/sapmnt/home/C5405944/.cache/emacs/straight/build-31.0.50/consult/consult.elc" . 143628)] nil))

(provide 'asdasd-ux-completion-consult)
