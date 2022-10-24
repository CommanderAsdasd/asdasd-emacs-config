;; this file setups only that persist in default emacs (isolating package issues)

(require 'package)

;; Paths




(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
;; (set-language-environment "UTF-8")

(setq byte-compile-warnings '(cl-functions))


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








(setq org-confirm-babel-evaluate 'nil)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(ido-mode)


;; (add-hook 'prog-mode-hook 'company-mode)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'dired-mode-hook 'auto-revert-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(delete-selection-mode)




(setq dired-dwim-target t)


(provide 'asdasd-config-defaults)
