;;
;; README

;; * Asdasd agile config

;; based on modular-config package

;; create files like asdasd- to separate own-written from loaded modules
;; collect into-modules-groups


;; Why all of us like emacs so much? Because it gives everything from the box better than Visual studio? 
;; I personally like it because of experiments, it's full textual laboratory.
;; But, I'm programmer in general, and want not only develop and fixing emacs config, and also do things - in my experimental editor
;; So, this build aims maximum survivability of emacs after your experiments.
;; With understanding, which parts of the ship were thrown out to outer space during last trip.

;; ** Ideas 

;; *** Idea from "beyond python basics book" - do not group functions by "what they are", but "what they're doing". "Why (what does), not what (is)"
;; so I shouldn't do "keybindings", "" module - because it's "what"
;; "ux" module is bit better

;; *** isolate glitching parts of config into submodules
;; model imports list
;; (ux . ()
;; ())

;; * TODO: folder structure?


;; Integrate todo's with org-agend
;; write "open init.el" function

;; make a list of packages that I'm liked (from spacemacs and purcell's)
;; use package manager - el-ge
;; 

;; * Help sources
;; [[https://caiorss.github.io/Emacs-Elisp-Programming/Elisp_Programming.html][Elisp programming]]

;; uses outshine

;; CONFIG
;; * 
;; 
;; * TODO disabling regex [[https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/][spedup]

;; helm-moccur in all open buffers

(defconst config-directory (concat (file-name-directory user-emacs-directory)))

(setq ELS (expand-file-name (concat config-directory "/els")))
(add-to-list 'load-path ELS)

(setq modular-config-list '(
			              (main (asdasd-magit ui asdasd-ux asdasd-grep asdasd-narrowing-helm))
			              ))




(defun variable-switch (variable)
  (interactive "P")
  (setq variable (if variable
                     nil
                   t)))

(defun asdasd/signature-check-mode (&optional arg)
  "enabler-disabler of package-check-signature"
  (interactive "P")
  (if arg (cond ((eq arg 0) (setq package-check-signature nil))
                ((eq arg 1) (setq package-check-signature t)))
    (variable-switch package-check-signature))
  (message "current: %s" (symbol-value package-check-signature)))

(asdasd/signature-check-mode 0)

;; wrapper function print message when buffer evaluated
(defun asdasd-eval-buffer ()
  (interactive)
  (eval-buffer)
  (message "evaluated buffer"))


(define-key emacs-lisp-mode-map (kbd "C-c C-b") 'asdasd-eval-buffer)









;; (map-put bookmark-alist '("test" . '(filename . "c:/")))




;; (pp bookmark-alist)




;; (let ((file-name-handler-alist nil))


(setq gc-cons-threshold 100000000)


;; ** Packages




;; '(helm-mini-default-sources
;;   '(helm-source-buffers-list helm-source-buffer-not-found helm-source-bookmarks helm-sources))

;; (require 'asdasd-system.el)


'(helm-source-names-using-follow '("org-roam-find-file"))
(put 'upcase-region 'disabled nil)

;; (put 'dired-find-alternate-file 'disabled nil)


(asdasd/signature-check-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(custom-safe-themes
   '("cf861f5603b7d22cb3545a7c63b2ee424c34d8ed3b3aa52d13abfea4765cffe7" default))
 '(eww-download-directory "c:/Downloads/")
 '(package-selected-packages
   '(use-package bookmark-view find-file-rg corfu sparqpl-mode puni org-projectile helm-rg dashboard markdown-preview-eww ergoemacs-status org-brain evil-tree-edit helm-evil-markers poetry tree-edit w3 lispy projectile-ripgrep command-log-mode Outshine outshine zenburn-theme yatemplate yasnippet-snippets yankpad yaml yagist xah-find ws-butler workgroups2 winum which-key wgrep-helm wgrep-ag web-server vue-mode vterm vscode-dark-plus-theme vlc virtualenvwrapper virtualenv vc-osc use-package-el-get undo-tree undo-fu ujelly-theme typing-game typescript-mode tron-legacy-theme treeview tldr telega system-packages switch-window string-utils sr-speedbar speed-type sparql-mode smartparens skewer-mode sicp save-visited-files rotate ripgrep request-deferred rainbow-delimiters rainbow-blocks python-info pyenv-mode py-autopep8 processing-snippets processing-mode powershell pomodoro pomidor pippel pipenv pfuture persistent-scratch pdfgrep ox-epub origami-predef org-roam org-randomnote org-noter-pdftools org-mind-map org-category-capture org-babel-eval-in-repl numpydoc neuron-mode neotree multiple-cursors mini-modeline melancholy-theme magithub luarocks lua-mode lsp-python-ms lsp-haskell lsp-docker list-packages-ext linum-relative kubernetes json-navigator json-mode js-react-redux-yasnippets jist java-snippets idomenu hydra hy-mode htmlize howdoi highlight-thing highlight-symbol helpful help-find helm-youtube helm-w3m helm-tramp helm-system-packages helm-swoop helm-org helm-make helm-ls-git helm-gtags helm-grepint helm-firefox helm-descbinds helm-cider helm-chrome-history helm-chrome helm-c-moccur helm-ag groovy-mode graphviz-dot-mode google-translate gnu-elpa-keyring-update github-search github-explorer git-gutter git-gutter+ gist gif-screencast general folding fold-this focus flycheck firefox-controller findr ffmpeg-player expand-region exec-path-from-shell evil emms emacsql-sqlite3 elpy elgrep eldoc-cmake el-get edit-server edebug-x ecb dynamic-graphs duplicate-thing dracula-theme dot-mode doct dockerfile-mode dired-subtree dired-filter devdocs-browser devdocs csharp-mode conda company-tabnine company-glsl company-c-headers comment-tags clojure-quick-repls clipmon cheatsheet cheat-sh cfrs capture build-helper browse-kill-ring babel-repl autobookmarks auto-yasnippet auto-virtualenv arch-packer anti-zenburn-theme annotate-depth anaconda-mode ace-link ace-jump-mode ace-jump-helm-line))
 '(warning-suppress-types
   '((use-package)
     (use-package)
     (use-package)
     (use-package)
     (use-package))))

(use-package modular-config
  :ensure t)

(require 'asdasd-packaging)
(modular-config-command-line-args-process)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
