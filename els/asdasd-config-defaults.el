;; this file setups only that persist in default emacs (isolating package issues)

(require 'package)

;; Paths

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
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

(progn
 (setq org-directory "c:/git/org-kasten")
 (setq org-default-notes-file (concat org-directory "1-notes.org")))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "3-todo.org") "Tasks")
         "* TODO %?\n %i\n")
        ("l" "Link" plain (file (concat org-directory "2-links.org"))
         "- %?\n %x\n")))

(setq org-capture-templates
    '(;; Computing
        ("c" "Computing")
        ("ce" "Emacs" entry (file "c:/git/org-kasten/1-notes.org")
        "* TODO %t %?\n" :prepend t)
        ;; Exercise
        ("e" "Exercise")
        ("er" "Logging a run" table-line (file+olp "~/org/training/training.org" "Running" "Log")
            "| %t | %? | km | min + s | | |" :prepend t)
        ("ec" "Logging a cycle" table-line (file+olp "~/org/training/training.org" "Cycling" "Log")
            "| %t | %? | km | min + s | | |" :prepend t)))

;; Hotkeys

;(global-set-key (kbd \"C-x C-b\") 'ibuffer)
(progn (global-set-key (kbd "C-x C-a") 'rename-buffer)
(global-set-key (kbd "C-x t") 'shell)
(global-set-key (kbd "C-x p") 'package-install)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f6>") 'recompile)
(global-set-key (kbd "\C-c\d") "\C-a\C- \C-n\M-w\C-y") ; duplicate line
(global-set-key "\C-cy" '(lambda ()
                           (interactive)
                           (popup-menu 'yank-menu)))
(global-set-key (kbd "C-c r") 'rgrep)
)
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

;; (add-hook 'prog-mode-hook 'company-mode)

(add-hook 'after-init-hook 'global-company-mode)


(provide 'asdasd-config-defaults)
