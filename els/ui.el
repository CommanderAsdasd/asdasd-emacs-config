(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-face-attribute 'lazy-highlight nil :foreground "black" :background "green" :weight 'bold)




(rainbow-delimiters-mode t) 

(use-package ace-link
  :ensure t
  :defer)

(use-package ace-jump-mode
  :after ace-link
  :ensure t
  :config
  (general-define-key
   "M-q [" 'ace-jump-mode-pop-mark
   "M-q ]" '(ace-jump-mode-pop-mark )
    "<C-tab>" 'ace-jump-mode)
  )


  
(use-package vscode-dark-plus-theme
  :straight t
  :config(load-theme 'vscode-dark-plus t)
  (set-frame-font "-outline-Source Code Pro-bold-normal-normal-mono-17-*-*-*-c-*-iso8859-7" nil t) )
(progn
  
)
;; (use-package mini-modeline
;;   :ensure t
;;   :config
;;   (mini-modeline-mode)
;;   )

(defun asdasd-current-buffer-other-frame ()
  "return current buffer in other frame"
  (interactive)
  (view-buffer-other-frame (buffer-name) t)
  )

(general-define-key
 ;; NOTE: keymaps specified with :keymaps must be quoted
 ;;:mode 'mode-line
 "<mode-line><C-drag-mouse-1>" 'asdasd-current-buffer-other-frame
 ;; ...
 )

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(general-define-key      
 "C-c C-<SPC>" 'switch-to-minibuffer)


(use-package treeview
  :ensure t)


(setq bidi-inhibit-bpa t)

(use-package spray
  :ensure t
  :config (general- mq-map "r s" 'spray-mode))


(use-package color-identifiers-mode
  :ensure t)

(use-package markdown-preview-eww
  :ensure t)

(use-package dashboard
  :ensure t
  :config )

(use-package sr-speedbar
  :ensure t)



(provide 'asdasd-ui)
