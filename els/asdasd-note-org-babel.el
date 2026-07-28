(require 'ob-js)

(defun org-babel-edit-prep:python (babel-info)
  (org-babel-tangle)
  (setq-local buffer-file-name (concat (->> babel-info caddr (alist-get :tangle))))
  (lsp))

(defun org-babel-edit-prep:mermaid (babel-info)
  (org-babel-tangle)
  (setq-local buffer-file-name (concat (->> babel-info caddr (alist-get :tangle))))
  ;; (lsp)
  )

(defun org-babel-edit-prep:dockerfile (babel-info)
  (org-babel-tangle)
  (setq-local buffer-file-name (concat (->> babel-info caddr (alist-get :tangle))))
  ;; (lsp)
  )

(defun asdasd-note-org-babel-dummy-demarcate ()
  (interactive)
  (previous-line)
  (move-end-of-line nil)
  (insert (format "
#+end_src
#+begin_src %s" (org-element-property :language (org-element-at-point)))))

(use-package org
  :straight (:type built-in)
  :bind* (:map org-mode-map ("C-c C-v C-r" . org-babel-remove-result))
  :custom
  (org-babel-default-header-args
   `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil (format "* session %s %s " (org-element-property :language (org-element-at-point)) (file-name-nondirectory buffer-file-name))))
     (:async)
     (:results . "drawer replace")
     (:comments . "link")  ;; add a link to the original source
     (:exports . "both")
     (:cache . "no")
     (:eval . "never-export") ;; explicitly evaluate blocks instead of evaluating them during export
     (:hlines . "no")
     (:tangle . "no")))
  ;; Set default header args for bash blocks
  (org-babel-default-header-args:bash
   '(;; (:async)
     ;; (:session . "bash")
     ))   ;; name of the default session
  (org-confirm-babel-evaluate nil)
  (org-edit-src-turn-on-auto-save t)
  
  :config (org-babel-do-load-languages
           'org-babel-load-languages
           '((python . t)
             ;; (hy . t)
             (shell . t)
             ;; (bash . t)
             ;; (powershell . t)
             (js . t)
             (C . t)
             (mermaid . t)
             (eshell . t)
             (go . t)
             ;; (dockerfile .t)
             )
           )
  (add-to-list 'org-src-lang-modes '("dockerfile" . dockerfile))
  (mapc (lambda (x) (add-to-list 'org-structure-template-alist x)) (list '("sp" . "src python")
                                                                         '("sg" . "src go")
                                                                         '("se" . "src elisp")
                                                                         '("ss" . "src")
                                                                         '("sh" . "src sh")
                                                                         '("sb" . "src bash")
                                                                         '("sr" . "src prog")
                                                                         '("sd" . "src diff"))))


(use-package org-tanglesync
  ;; :hook (
  ;;        ;; (org-mode . org-tanglesync-mode)
  ;;        ;; enable watch-mode globally:
  ;;        ;; ((prog-mode text-mode) . org-tanglesync-watch-mode)
  ;;        )
  :config
  (defun asdasd-note-org-babel-detaglesync ()
    "auto add current buffer to watch and org-tanglesync-process-buffer-automatic"
    (interactive)
    (add-to-list 'org-tanglesync-watch-files buffer-file-name)
    (org-tanglesync-process-buffer-automatic)))


(use-package ob-p5js)

(use-package org-rich-yank
  :bind ("C-c o r" . org-rich-yank))


(use-package ob-mermaid)

(use-package ob-go)

(use-package ob-async
  :custom (ob-async-no-async-languages-alist '("sh" "python" "elisp" "go" "bash")))

(provide 'asdasd-note-org-babel)
