



(use-package rainbow-delimiters
  :config (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

(use-package expand-region
  :config (progn (global-set-key (kbd "C-+") 'er/contract-region)
		 (global-set-key (kbd "C-=") 'er/expand-region)))

(use-package yasnippet
  :config
  (global-set-key (kbd "C-S-s") 'yas-insert-snippet)
  (global-set-key (kbd "C-S-n") 'yas-new-snippet)
  (global-set-key (kbd "C-S-v") 'yas-visit-snippet-file)
  (yas-global-mode)
  
  )



(use-package company
  :config (global-company-mode))


;; (ibuffer-delete-saved-filters)


;; https://www.reddit.com/r/emacs/comments/a9hfez/treat_hyphen_as_word_delimiter_in_evil_mode/

(modify-syntax-entry ?_ "w" prog-mode-syntax-table)

;; (modify-syntax-entry ?_ "w" js2-mode-syntax-table)

(modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)
(modify-syntax-entry ?_ "w" emacs-lisp-mode-syntax-table)


;; (use-package package-name
;;   :ensure t)

;; (use-package emr
;;   :ensure t
;;   :config (define-key prog-mode-map (kbd "M-RET") 'emr-show-refactor-menu))


(setq processing-location "E:/downloads_23.06/processing-3.5.4/processing-java.exe")
(setq processing-application-dir "E:/downloads_23.06/processing-3.5.4") 
(setq processing-sketchbook-dir "/path/to/processing-sketchbook-dir")



(use-package cider)


(global-set-key (kbd "C-S-p") 'check-parens)

(use-package smartparens
  :config
  (smartparens-global-mode)
  )

(use-package kubernetes
  :config
  :commands (kubernetes-overview)
  )

(use-package kubernetes-helm
  :config

  )

(use-package dockerfile-mode
  :config
  )

(use-package company-tabnine
  :config (company-tabnine-install-binary)

  )

(use-package smart-compile
  :config (add-to-list 'smart-compile-alist '(\\))

  )

(use-package highlight-parentheses
  :config (global-highlight-parentheses-mode)
  :hook 'minibuffer-setup-hook

  )

(use-package projectile
  :config (projectile-mode +1)
  ;; Recommended keymap prefix on Windows/Linux
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

(use-package glsl-mode
  :config

  )

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode)
  (global-set-key (kbd "C-c u") 'undo-tree-visualize)
  )


(defun asdasd-rerun-last-shell-command ()
  "maps last command from command-history to [kbd]"
    (interactive)
    (let ((command (nth 0 shell-command-history)))
      (save-buffer)
      (async-shell-command `,command)))
(global-set-key (kbd "C-x C-r") 'asdasd-rerun-last-shell-command)


;;; imports
(use-package 'asdasd-programming-js)
(use-package 'asdasd-programming-treemacs)
(use-package 'asdasd-programming-shell)



(provide 'asdasd-programming)
