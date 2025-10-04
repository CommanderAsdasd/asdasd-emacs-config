

(defun org-babel-edit-prep:python (babel-info)
  ;; (org-babel-tangle)
  (setq-local buffer-file-name (concat (->> babel-info caddr (alist-get :tangle))))
  ;; (lsp)
  )

(use-package ob
  :straight nil
  :custom
  (org-babel-default-header-args
   `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil buffer-file-name))
     (:async)
        
        (:comments . "link")  ;; add a link to the original source
        (:exports . "both")
        (:cache . "no")
        
        (:hlines . "no")
        (:tangle . "no")))
  (org-confirm-babel-evaluate nil)
  (org-edit-src-turn-on-auto-save t)
  :config (require 'ob-js)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ;; (hy . t)
     (shell . t)
     (bash . nil)
     (powershell . t)
     (js . t)
     (mermaid . t)
     (eshell . t))
   )
  (mapc
   (lambda (elt) (add-to-list 'org-structure-template-alist elt))
   '(("sp" . "src python")
     ("se" . "src emacs-lisp")
     ("ss" . "src")))
  )


(use-package org-tanglesync
  :preface (defun asdasd-note-org-babel-detaglesync ()
             "auto add current buffer to watch and org-tanglesync-process-buffer-automatic"
             (interactive)
             (let ((org-tanglesync-watch-files `(,(buffer-file-name))))
               
               (org-tanglesync-process-buffer-automatic)))
  
  :config )


(use-package ob-p5js)

(use-package org-rich-yank)

(use-package ob-mermaid
 :config )


(use-package ob-async
  :custom (ob-async-no-async-languages-alist '("sh" "python" "elisp")))

;; (use-package ob-session-async)
