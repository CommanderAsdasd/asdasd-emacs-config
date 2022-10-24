;; https://github.com/minad/vertico

(modular-config-load-modules '(asdasd-config-keys))

(use-package corfu
  :ensure t
  :custom (corfu-auxo t)                ;
  (corfu-auto t
              corfu-auto-delay 0
              corfu-auto-prefix 0
              completion-styles '(basic))
  :config (global-corfu-mode))

(use-package vertico
  :ensure t
  :config (vertico-mode))

(use-package marginalia
  :ensure t
  :config (marginalia-mode))

(use-package orderless
  :ensure A
  :custom   (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))


(use-package corfu-doc
  :custom
  (corfu-map (kbd "M-p") #'corfu-doc-scroll-down) ;; corfu-next
  (corfu-map (kbd "M-n") #'corfu-doc-scroll-up)  ;; corfu-previous
   
  :ensure t
  :config (add-hook 'corfu-mode-hook #'corfu-doc-mode))



(provide 'asdasd-completion-corfu)

