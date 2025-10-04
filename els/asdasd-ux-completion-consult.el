(use-package compat
  :straight (compat :host github :repo "emacs-compat/compat"))

;; corfu - completion framework in the style of company-mode
;; embark - completing-read actions

(defun windize-path (path)
  (with-temp-buffer (insert path)
                      (goto-char (point-min))
                    (while (search-forward "/" nil t)
                      (replace-match "\\" nil t))
                    (buffer-string)))



(use-package orderless)

;; consult - completing-read replacements

(use-package consult
  ;; :config ;; (defun asdasd-vertico-consult-hide-comments ()
          ;;    (consult-focus-lines (concat "" )))
  :custom (consult-preview-key "M-.")
  (switch-to-buffer-in-dedicated-window t)
  (isearch-pre-move-point t)
  :bind
  ("C-M-S-r" . consult-history)
  ("M-s c o" . consult-outline)
  ("M-s c f" . consult-focus-lines)
  ("M-s c k" . consult-keep-lines)
   ("C-c r c" . consult-ripgrep)
   ("C-c r r" . ripgrep-regexp)
   ("M-s a" . consult-line-multi)
   ;; ("M-s s" . isearch-forward)
   ;; ("M-s r" . isearch-backward)
   ("C-s" . isearch-forward)
   ("C-S-s" . isearch-forward-regexp)
   ("M-s M-s" . consult-line)
   ("M-y" . consult-yank-from-kill-ring)
   ("M-S-y" . consult-yank-pop)
   ("C-x C-b" . consult-recent-file)
   ("C-x r l" . consult-bookmark)
   ("C-h i" . consult-info)
   ("C-x c m" . consult-mark)
   ("C-x c M" . consult-global-mark)
   ("M-r" . consult-history)
   (:map minibuffer-local-map)
   ("M-r" . consult-history)
   ("M-R" . previous-matching-history-element)
   ;; (:map shell-mode-map ("M-r" . consult-history))
   
  ;; (:map ctl-x-r-map
  ;; )
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
  :bind*
  ("C-c r e" . consult-everything)
  ("C-x k d" . consult-dir))


(use-package consult-dir
  :config )

(provide 'asdasd-ux-completion-consult)
