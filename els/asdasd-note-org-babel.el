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

(use-package org
  :straight (:type built-in)
  :custom
  (org-babel-default-header-args
      '((:session . "none")
        (:results . "drawer replace")
        (:comments . "link")  ;; add a link to the original source
        (:exports . "both")
        (:cache . "no")
        (:eval . "never-export") ;; explicitly evaluate blocks instead of evaluating them during export
        (:hlines . "no")
        (:tangle . "no")))
  ;; Set default header args for bash blocks
  (org-babel-default-header-args:bash
   '((:async)
     (:session . "bash")))   ;; name of the default session
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
                                                                         '("se" . "src elisp")
                                                                         '("ss" . "src"))))

(use-package org-tanglesync
  :hook ((org-mode . org-tanglesync-mode)
         ;; enable watch-mode globally:
         ((prog-mode text-mode) . org-tanglesync-watch-mode))
  :config
  (defun asdasd-note-org-babel-detaglesync ()
    "auto add current buffer to watch and org-tanglesync-process-buffer-automatic"
    (interactive)
    (add-to-list 'org-tanglesync-watch-files buffer-file-name)
    (org-tanglesync-process-buffer-automatic)))


(use-package ob-p5js)

(use-package org-rich-yank)

(use-package ob-mermaid)

(use-package ob-go)
