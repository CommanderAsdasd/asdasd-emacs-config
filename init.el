;; README

;; TODO: sane folder structure
;; Integrate todo's with org-agend
;; write "open init.el" function
;; make a list of packages that I'm liked (from spacemacs and purcell's)
;; Push this to 


;; CONFIG

;; SECTION-LOADPATH

(add-to-list 'load-path "~/.emacs.d/els/")

;; SECTION-PACKAGES

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; SECTION-SERIVCES

(server-start)
(require 'edit-server)
(edit-server-start)
(company-mode)



;; (require 'elisp-slime-nav) ;; optional if installed via package.el
;; (dolist (minibuffer-hook '(emacs-lisp-mode-hook ielm-mode-hook))
;; (add-hook minibuffer-hook 'turn-on-elisp-slime-nav-mode))

;in M-x customize
;minibuffer-depth-indica


;; SECTION-KEY

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-a") 'rename-buffer)
(global-set-key (kbd "C-x t") 'shell)
(global-set-key (kbd "C-?") 'company-select-next-if-tooltip-visible-or-complete-selection)
(global-set-key (kbd "C-x p") 'package-install)
(global-set-key (kbd "C-c c") 'org-capture)

;;(global-set-key (kbd "C-x l p") 'package-list-packages)



(global-set-key "\C-c\C-d" "\C-a\C- \C-n\M-w\C-y") ;; duplicate line


;; VARIABLES
(setq enable-recursive-minibuffers t)
(let (home )
(setq org-agenda-files '("/home/atankovskii/git/org-kasten/" "/home/atankovskii/.emacs.d/init.el"))


    (defun foo (arg)
      "Print the current raw prefix argument value."
      (interactive "P")
      (message "raw prefix arg is %S" arg))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (edit-server glsl-mode company-tabnine company magit browse-kill-ring artbollocks-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun open-init-el ()
  ;; opens init el
  (interacto)
    (find-file ~/.emacs.d/init.el))



(eval-after-load 'latex 
  '(define-key LaTeX-mode-map [(tab)] 'outline-cycle))


;; 
(put 'downcase-region 'disabled nil)


;; org-mode

(custom-set-variables
 '(org-directory "/home/atankovskii/git/org-kasten/"))
