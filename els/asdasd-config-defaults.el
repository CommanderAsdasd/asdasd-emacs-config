;; this file setups only that persist in default emacs (isolating package issues)

;; (use-package 'package)

;; Paths


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
;; (set-language-environment "UTF-8")

(setq byte-compile-warnings '(cl-functions))
(load-theme 'dracula t)

(winner-mode)
(savehist-mode)
(server-start)

(setq ac-ignore-case t)
(setq completion-ignore-case t)


(setq enable-recursive-minibuffers t)
(setq minibuffer-depth-indicate-mode t)
(put 'downcase-region 'disabled nil)
					;minibuffer-depth-indica

(eval-after-load 'latex
  '(define-key LaTeX-mode-map [(tab)] 'outline-cycle))

;; modes



;; org-mode



;; Hotkeys

;(global-set-key (kbd \"C-x C-b\") 'ibuffer)
					;(progn (global-set-key (kbd "C-x C-a") 'rename-buffer)

(global-set-key (kbd "C-c t t") 'shell)
(global-set-key (kbd "C-x p") 'package-install)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "\C-c\d") "\C-a\C- \C-n\M-w\C-y") ; duplicate line
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))
(global-set-key (kbd "C-c r") 'rgrep)

;; (global-set-key "\C-c\C-o" '(lambda ()
;; 			      "run other window menu"
;;                            (interactive)
;;                            (popup-menu 'other-window)))



;;(global-set-key (kbd "C-x l p") 'package-list-packages)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-c o") 'occur)
(setq org-confirm-babel-evaluate 'nil)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(ido-mode)
(global-superword-mode t)



(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key (kbd "C-c a") 'org-agenda)

(put 'upcase-region 'disabled nil)

(desktop-save-mode 1)


(defcustom desktop-globals-to-save
  '(kill-ring
    kill-ring-yank-pointer
    search-ring
    search-ring-yank-pointer
    regexp-search-ring
    regexp-search-ring-yank-pointer)
  "List of global variables that `desktop-clear' will clear.
An element may be variable name (a symbol) or a cons cell of the form
\(VAR . FORM).  Symbols are set to nil and for cons cells VAR is set
to the value obtained by evaluating FORM."
  :type '(repeat (restricted-sexp :match-alternatives (symbolp consp)))
  :group 'desktop
  :version "22.1")

(delete-selection-mode 1)

(provide 'asdasd-config-defaults)
