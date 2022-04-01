(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(set-face-attribute 'lazy-highlight nil :foreground "black" :background "green" :weight 'bold)

(use-package highlight-symbol
  :ensure t
  :init
  (progn (global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)))


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


;; (defmacro set-theme (theme)
;;   '((use-package (concat (theme
;;       :ensure t)
;;     (load-theme 'theme))
;;     )

  

(progn
  ;; (let* ((theme "ujelly"))
(use-package vscode-dark-plus-theme
  :ensure t)  
(load-theme 'vscode-dark-plus t)
(set-frame-font "-outline-Source Code Pro-bold-normal-normal-mono-17-*-*-*-c-*-iso8859-7" nil t))


(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

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




(defun slide-buffer (dir)
  "Move current buffer into window at direction DIR.
DIR is handled as by `windmove-other-window-loc'."
  (require 'windmove)
  (let ((buffer (current-buffer))
        (target (windmove-find-other-window dir)))
    (if (null target)
        (user-error "There is no window %s from here" dir)
      (switch-to-prev-buffer)
      (select-window target)
      (switch-to-buffer buffer nil t))))

(defun slide-buffer-up () (interactive) (slide-buffer 'up))
(defun slide-buffer-down () (interactive) (slide-buffer 'down))
(defun slide-buffer-left () (interactive) (slide-buffer 'left))
(defun slide-buffer-right () (interactive) (slide-buffer 'right))



(define-key global-map (kbd "C-S-<up>")    #'slide-buffer-up)
(define-key global-map (kbd "C-S-<down>")  #'slide-buffer-down)
(define-key global-map (kbd "C-S-<left>")  #'slide-buffer-left)
(define-key global-map (kbd "C-S-<right>") #'slide-buffer-right)


(define-key global-map (kbd "C-c <C-left>") 'windmove-left)
(define-key global-map (kbd "C-c <C-down>") 'windmove-down)
(define-key global-map (kbd "C-c <C-up>") 'windmove-up)
(define-key global-map (kbd "C-c <C-right>") 'windmove-right)




(provide 'asdasd-ui)
