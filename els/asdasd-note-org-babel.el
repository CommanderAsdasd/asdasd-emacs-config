

(defun org-babel-edit-prep:python (babel-info)
  ;; (org-babel-tangle)
  (setq-local buffer-file-name (concat (->> babel-info caddr (alist-get :tangle))))
  ;; (lsp)
  )

(defun asdasd-note-org-babel-dynamic-default-header-args ()
  ""
  (setq org-babel-default-header-args `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil (format "*session %s *"(buffer-name))))
                                   (:async . yes))
        )
  )


(use-package ob
  :straight nil
  :custom ;;
  (org-babel-default-header-args '((:tangle . "no"))
                                 )
  ;; (org-babel-default-header-args
  ;;  `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil buffer-file-name))
  ;;    (:async)
        
  ;;       (:comments . "link")  ;; add a link to the original source
  ;;       (:exports . "both")
  ;;       (:cache . "no")
        
  ;;       (:hlines . "no")
  ;;       (:tangle . "no")))
  (org-confirm-babel-evaluate nil)
  (org-edit-src-turn-on-auto-save t)
  ;; (org-babel-header-args:sh `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil (buffer-name)))
                                       ;; (:async)))
  :config
  (require 'ob-js)
  (add-hook 'org-mode-hook 'asdasd-note-org-babel-dynamic-default-header-args)
  ;; (add-hook 'org-mode-hook '(lambda ()
  ;;                              (setq org-babel-default-header-args
  ;;                                    `((:session . ,(if (eq major-mode 'emacs-lisp-mode) nil buffer-file-name))
  ;;                                      (:async)
        
  ;;                                      ;;       (:comments . "link")  ;; add a link to the original source
  ;;                                      ;;       (:exports . "both")
  ;;                                      ;;       (:cache . "no")
                                       
  ;;                                      ;;       (:hlines . "no")
  ;;                                      (:tangle . "no")))))
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
  :custom (ob-async-no-async-languages-alist '("sh" "python" "elisp" "go")))


(use-package ob-go
  :config )
;; (use-package ob-session-async)
(defun org-babel-tangle--ensure-dir (&rest _)
  "Create directories for tangled files declared in current Org buffer."
  (save-excursion
    (org-babel-map-src-blocks nil
      (let* ((info (org-babel-get-src-block-info 'light))
             (file (cdr (assq :tangle (nth 2 info)))))
        (when (and file (not (string= file "no")))
          (let ((dir (file-name-directory (expand-file-name file))))
            (when (and dir (not (file-exists-p dir)))
              (make-directory dir t))))))))

(advice-add 'org-babel-tangle :before #'org-babel-tangle--ensure-dir)
