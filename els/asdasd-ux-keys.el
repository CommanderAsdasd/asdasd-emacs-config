;; Hotkeys

(use-package general
  :ensure t)
;; * Global Keybindings
;; `general-define-key' acts like `global-set-key' when :keymaps is not
;; specified (because ":keymaps 'global" is the default)
;; kbd is not necessary and arbitrary amount of key def pairs are allowed

(general-define-key                      ; or 'smex
 "C-x p" 'package-install)

(general-define-key
 "<mode-line><C-drag-mouse-1>" 'counsel-org-tag
 ;; ...
 )


;(global-set-key (kbd \"C-x C-b\") 'ibuffer)
(progn (global-set-key (kbd "C-x C-a") 'rename-buffer)

(setq compilation-ask-about-save nil)       

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)

(global-set-key (kbd "\C-c\d") "\C-a\C- \C-n\M-w\C-y") ; duplicate line
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))
(global-set-key (kbd "C-c r") 'ripgrep-regexp)
)
;; (global-set-key "\C-c\C-o" '(lambda ()
;; 			      "run other window menu"
;;                            (interactive)
;;                            (popup-menu 'other-window)))

;;(global-set-key (kbd "C-x l p") 'package-list-packages)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c o") 'occur)


(define-prefix-command 'mq-map)
(global-set-key (kbd "M-q") 'mq-map)
(define-prefix-command 'mq-ace-jump-map)

(general-define-key      
 :prefix "M-q"
 "a" 'ace-link
 "w" 'ace-window
 "q" 'mq-ace-jump-map
 "q w" 'ace-jump-word-mode
 "q c" 'ace-jump
 ;; "q q" 'ace-jump-do ;; I want to make various actions with ace-jump aim
 "m" 'woman
 )



(global-set-key (kbd "C-c C-d") 'duplicate-thing)


(global-set-key (kbd "C->") 'mc/mark-next-like-this-word)

(progn 
(global-set-key (kbd "C-?") 'company-select-next-if-tooltip-visible-or-complete-selection)
(global-set-key (kbd "C-c e") 'everything)

;; (global-set-key (kbd "C-c s") 'hs-show-all)
;; (global-set-key (kbd "C-c f") 'hs-hide-all) ;fold
;; (global-set-key (kbd "M-s i") 'imenu)
)






(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c s") 'helm-swoop)

(global-set-key (kbd "C-=") 'er/expand-region)


;; (global-set-key (kbd "C-c l") 'org-roam-)

(global-set-key (kbd "C-+") 'er/contract-region)


(global-set-key (kbd "C-x f") 'find-file)

;;; Ctl-x-5 map
;;
(define-key ctl-x-5-map (kbd "C-x c t") 'helm-top-in-frame)
(define-key ctl-x-5-map (kbd "C-x c i") 'helm-imenu-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-f") 'helm-find-files-in-frame)
(define-key ctl-x-5-map (kbd "M-x")     'helm-M-x-in-frame)
(define-key ctl-x-5-map (kbd "C-s")     'helm-occur-in-frame)
(define-key ctl-x-5-map (kbd "C-x C-b") 'helm-mini-in-frame)
(define-key ctl-x-5-map (kbd "M-g a")   'helm-do-grep-ag-in-frame)
(define-key ctl-x-5-map (kbd "M-g g")   'helm-do-git-grep-in-frame)



;; Indent or complete with completion-at-point
;; (setq tab-always-indent 'complete)

;; (define-key global-map (kbd "<backtab>") 'completion-at-point)

(add-hook 'python-mode-hook '(lambda () (local-set-key (kbd "C-c C-c") 'python-shell-send-region) (interactive "") ))

(global-set-key (kbd "C-M-y") 'yank-region-other-window)
(global-set-key (kbd "M-q l") 'asdasd-mark-line)
(global-set-key (kbd "M-q r") 'helm-comint-input-ring)
(define-prefix-command 'org-roam-asdasd-map)
(global-set-key  (kbd "M-q r") 'org-roam-asdasd-map)

(global-unset-key (kbd "<lwindow>"))t


(use-package 
  evil 
  :ensure t 
  :init (setq evil-move-cursor-back nil) 
  (setq evil-normal-state-cursor '(box "gray")) 
  :general (:states '(normal emacs visual) 
			"j"
		    'evil-next-visual-line
		    "k"
		    'evil-previous-visual-line))

;; (require 'asdasd-ux-keys-evil)

(require 'asdasd-ux-keys-chord)
(provide 'asdasd-ux-keys)
