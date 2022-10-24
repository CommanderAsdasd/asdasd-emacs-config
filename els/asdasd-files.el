    (use-package undo-fu
    :ensure t)

    ;; (use-package undo-hist
    ;;   :ensure t )



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



    (defun asdasd/bookmarks-alist-clean ()
    (interactive)
    (setq bookmark-alist ())
    )



    (defun asdasd-delete-file-and-buffer ()
    "Kill the current buffer and deletes the file it is visiting."
    (interactive)
    (let ((filename (buffer-file-name)))
        (when filename
        (if (vc-backend filename)
            (vc-delete-file filename)
            (progn
            (delete-file filename)
            (message "Deleted file %s" filename)
            (kill-buffer))))))



    (use-package find-file-rg
    :ensure t)


    ;; autorecover file on open
    (defun asdasd/recover-file-on-open ()
    (let ((file (buffer-file-name)))
        (when file
        (setq buffer-backed-up nil)
        (revert-buffer t t))))

    (remove-hook 'find-file-hook 'asdasd/recover-file-on-open)


    (defun asdasd-move-current-file (new-name)
    (interactive "FFilename")
    (let ((old-name (buffer-file-name)))
        (rename-file old-name new-name 1)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)
        (message "File %s renamed to %s" old-name new-name)))

    (defun asdasd-delete-current-file ()
    (interactive)
    (let ((filename (buffer-file-name)))
        (when filename
        (if (vc-backend filename)
            (vc-delete-file filename)
            (progn
            (delete-file filename)
            (message "Deleted file %s" filename)
            (kill-buffer))))))

    ;; list all symbols in new buffer
    (defun asdasd/find-file-or-link-at-point ()
    (interactive)
    (let (($word (thing-at-point 'symbol)))
        (if $word
            (progn
            (if (file-exists-p $word)
                (find-file $word)
                (browse-url $word)))
        (call-interactively 'hippie-expand))))

    (general-define-key
    :mode 'all
    "C-c C-f" 'asdasd/find-file-or-link-at-point)


    ;; add to bookmark-alist all files in current directory
    (defun asdasd/add-working-directory-files-to-bookmarks ()
    (interactive)
    (let ((files (directory-files (expand-file-name "./") t "^asdasd.*el$")))
        (mapcar (lambda (file)
                (bookmark-set (file-name-nondirectory file) file))
                files)))

    ;; expand-file-name correctly in windows
    (defun asdasd/expand-file-name (file-name)
    ;; if starts with "/" slash - delete it
        (if (string-prefix-p "/" file-name)
            (substring file-name 1)
            (expand-file-name file-name)))
    ;; (expand-file-name file-name (file-name-directory (buffer-file-name))))


    (asdasd/expand-file-name "/c/")

    (defun asdasd/get-mp4-files (dir)
    (interactive "D")
    (let ((files (directory-files (expand-file-name dir) t "^.*asdasd.*mp4$")))
        ;; return list of pairs name - path
        (mapcar (lambda (file)
                (cons (file-name-nondirectory file) file))
                files)))


    (asdasd/get-mp4-files "e:/")

    ;; get random file path from list
    (defun asdasd/get-random-file-path (files)
    (interactive "aFiles:")
    (let ((file (nth (random (length files)) files)))
        (cdr file)))


    (asdasd/get-random-file-path (asdasd/get-mp4-files "e:/"))
    ;; wrap with lambda and bind to key
    (general-define-key
    :mode 'insert
    "M-q o" (lambda () (interactive) (insert (asdasd/get-random-file-path (asdasd/get-mp4-files "e:/")))))

    ;; (asdasd/get-all-mp4-files "e:/")

    (asdasd/add-working-directory-files-to-bookmarks)

    ;; emacs auto revert files
    (global-auto-revert-mode 1)

    ;; dired auto revert files
    (add-hook 'dired-mode-hook 'auto-revert-mode)

    ;; (global-set-key (kbd ))
    (defun asdasd/print-dir ()
    "docstring"
    (interactive)
    (let ((current-prefix-arg 4))
    (command-execute (read-directory-name "dir print")))
    )

    (defun asdasd/insert-file ()
    "docstring"
    (interactive)
    (insert (read-file-name "file to insert")))

    ;; w32-shell-execute symbol at point
    (defun asdasd/w32-shell-execute-symbol-at-point ()
    "docstring"
    (interactive)
    (let (($word (thing-at-point 'symbol)))
        (if $word
            (w32-shell-execute "open" $word))))



    (provide 'asdasd-files)
    ;;; asdasd-files.el ends here

