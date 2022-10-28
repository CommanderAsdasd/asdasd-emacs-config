;; vertico - incremental minibuffer completion
(use-package vertico
  :straight t
  :config (vertico-mode))

;; orderless - completion style for vertico
(use-package orderless
  :straight t
  :init (setq completion-styles '(orderless)))

;; marginalia - annotations for completion candidates
(use-package marginalia
  :straight t
  :config (marginalia-mode))

;; corfu - completion framework in the style of company-mode
(use-package corfu
  :straight t
  ;; :config (corfu-global-mode)
  )

;; embark - completing-read actions
(use-package embark
  :straight t
  :bind
  ("C-." . embark-act)
  ("C-," . embark-dwim)
  ("C-h B" . embark-bindings))

;; consult - completing-read replacements
(use-package consult
  :straight t
  :bind ("C-x r l" . consult-bookmark)
  ("C-c r" . consult-ripgrep)
  ("C-s" . isearch-forward)
  ("C-S" . isearch-backward)
  ("C-M-S-s" . consult-isearch-history)
  :config
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion))))
  (consult-customize
           consult-ripgrep consult-git-grep consult-grep
           consult-bookmark consult-recent-file consult-xref
           consult--source-file consult--source-project-file consult--source-bookmark
           :preview-key (kbd "M-.")))
