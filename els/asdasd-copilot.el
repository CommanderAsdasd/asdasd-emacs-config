;;

(defun my-tab ()
  (interactive)
  (or (copilot-accept-completion)
      (company-indent-or-complete-common nil)
      (org-insert-heading-respect-content)))

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :config
  (global-set-key (kbd "C-<return>") 'my-tab)
  (global-set-key (kbd "C-<return>") 'copilot-accept-completion)
  (global-set-key (kbd "M-C-<return>") 'copilot-accept-completion-by-word)
  (add-hook 'prog-mode-hook 'copilot-mode)
  (add-hook 'org-mode-hook 'copilot-mode)
  )
  ;; (define-key prog-mode-map (kbd "C-<return>") 'my-tab)
  ;; (define-key org-mode-map (kbd "C-<return>") 'copilot-accept-completion)
;; parent of prog-mode-map is text-mode-map
;; you can utilize :map :hook and :config to customize copilot



; complete by copilot first, then company-mode

;; (modular-config-load-modules '(asdasd-company))


; modify company-mode behaviors

