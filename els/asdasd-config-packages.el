

;; this file setups packaging
;; (el-get 'sync)

;; Mode
(use-package company
  :ensure t
  :config (company-mode))


(setq lazy-highlight-buffer nil)


(progn 
  (global-set-key (kbd "C-?") 'company-select-next-if-tooltip-visible-or-complete-selection)
  (global-set-key (kbd "C-c e") 'everything)
  (global-set-key (kbd "M-s i") 'imenu))



(setq processing-sketchbook-dir "c:/git/Processing_sketches/")
(setq processing-location "E:\\downloads_23.06\\processing-3.5.4")


;; (bind-keys :map global-map
;;             :prefix "`"
;;             :prefix-map my-prefix-map
;;             ("-" . split-window-below)
;;             ("|" . split-window-right)
;;             ("d" . delete-window)
;;             ("n" . other-window)
;;             ("h" . windmove-left)
;;             ("j" . windmove-down)
;;             ("k" . windmove-up)
;;             ("l" . windmove-right))


(global-set-key (kbd "C-c C-l") 'org-store-link)
(global-set-key (kbd "C-c l") 'org-insert-link)


(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c s") 'helm-swoop)
(global-set-key (kbd "M-s x") 'helm-M-x)

(global-set-key (kbd "C-=") 'er/expand-region)


(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-query-replace)


(setq-local eldoc-documentation-function #'ggtags-eldoc-function)
(yas-global-mode 1)




(setq tramp-default-method "plink")
(setq helm-tramp-custom-connections '((format "/plink:192.168.56.%d:/usr/bin/bash" (read-number "address")) ))

(ido-mode nil)
(global-set-key (kbd "C-x f") 'find-file)

(require 'use-package-el-get)




;; (global-set-key (kbd "C-c l") 'org-roam-)

(use-package edit-server
  :ensure t
  :commands edit-server-start
  :init (if after-init-time
              (edit-server-start)
            (add-hook 'after-init-hook
                      #'(lambda() (edit-server-start))))
  :config (setq edit-server-new-frame-alist
                '((name . "Edit with Emacs FRAME")
                  (top . 200)
                  (left . 200)
                  (width . 80)
                  (height . 25)
                  (minibuffer . t)
                  (menu-bar-lines . t)
                  (window-system . x))))

;; (setq load-path (cons "DIR/xref/EMACS" LOAD-PATH))
;; (SETQ EXEC-PATH (CONS "DIR/XREF" exec-path))
;; (load "xrefactory")

(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(ace-link-setup-default)

;; (define-key global-map (kbd "C-d") 'delete-char)
;; (define-key global-map (kbd "C->") ')




(setq system-packages-use-sudo nil)



;; (global-set-key (kbd "C-<TAB>=") '')


;; (global-set-key (kbd "C-<")' mc/mark-previous-like-this')







(add-to-list 'load-path (expand-file-name "els/npy.el" user-emacs-directory))
;; (require 'npy)
;; (npy-initialize)


(defmacro macro (&rest body)
  (let ((result (pop body)))
    
  (dolist (form body result)
    (setq result (append form (list result))))))

(macro 1 (+ 2) (+ 4) (list))



;; (use-package docker
;;   :ensure t
;;   :el-get t)

 (projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  ;; (when (require 'edit-server nil t)
  ;;   (setq edit-server-new-frame nil)
  ;;   (edit-server-start))

;; (require 'ox-moderncv)
;; (use-package ox-moderncv
;;     :load-path  "c:/Users/asdasd/AppData/Roaming/.emacs.d/packages-user/org-cv/"
;;     :init (require 'ox-moderncv)))

;; (use-package gnu-elpa-keyring-update
;;   :ensure t )

;; (progn (setq package-check-signature nil)
;;        (package-install 'gnu-elpa-keyring-update)
;;        (gnu-elpa-keyring-update)
;;        (setq package-check-signature t))

;; (defmacro switch ()
  ;; )



(provide 'asdasd-config-packages)

