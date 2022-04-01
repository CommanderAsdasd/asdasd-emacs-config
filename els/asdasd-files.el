(use-package undo-fu
  :ensure t)

;; (use-package undo-hist
;;   :ensure t )

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode)
  (general-define-key "M-q u" 'undo-tree-visualise))

(use-package dired-filter
  :config (add-hook 'dired-mode-hook 'dired-filter-mode))

(defun asdasd/find-file-at-this-position ($file)
  "finds another file and go to same point postion"
  (interactive "ffile")
  (let* (($old-point (point)))
    (find-file $file)
    (goto-char $old-point)))



(define-prefix-command 'terminal-map)

(general-define-key
 "C-c t" 'terminal-map)

(general-define-key
 :prefix "C-c t"
 "b" 'shell-bash
 "c" 'shell-cmd
 "t" 'shell)

(recentf-mode 1)
(setq recentf-max-menu-items 250)
(setq recentf-max-saved-items 250)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)



;; (general--define-prefix
;; ())


(defun bookmark-construct
    (name file-name)
  "non-interactive bookmarking"
  (let ((new-bookmark `(,name . ('filename . file-name))))
    new-bookmark
    ))

(bookmark-construct "a" "c")


(defun asdasd/bookmarks-alist-clean ()
(interactive)
  (setq bookmark-alist ())
  )

;; (bookmark-file "a" "c:/")


;; (mapcar* #'bookmark-file (directory-files
;;              (expand-file-name "./") nil "^asdasd.*el$")
;;             (directory-files
;;                         (expand-file-name "./") t "^asdasd.*el$"))


(use-package find-file-rg
  :ensure t)


(provide 'asdasd-files)
