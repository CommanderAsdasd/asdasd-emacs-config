(use-package pytest
  ;; [2025-08-18]+ hook
  ;; :config
  
  ;; (add-hook 
  ;;     (lambda () 
  ;;       (setq-local comment-start "# "
  ;;                   comment-end ""
  ;;                   comment-start-skip "#+\\s-*")))
  :bind
  (:map python-mode-map
        ("C-c t t" . pytest-one)
        ("C-c t a" . pytest-all))
  (:map python-ts-mode-map
        ("C-c t t" . pytest-one)
        ("C-c t a" . pytest-all))
  )

(use-package python-pytest)

(defun my-pytest-run-from-temp-buffer ()
  "Run pytest tests from current buffer contents"
  (interactive)
  (let ((temp-file (make-temp-file "pytest-" nil ".py"))
        (default-directory (expand-file-name default-directory)))
    (write-region (point-min) (point-max) temp-file)
    (unwind-protect
        (progn
          (python-pytest-file temp-file)
          (delete-file temp-file)))))

(defun pytest-run-from-temp-buffer ()
  "Run pytest tests from current buffer contents"
  (interactive)
  (let ((temp-file (make-temp-file "pytest-" nil ".py"))
        (default-directory (expand-file-name default-directory))
        (python-pytest-project-root-override "/tmp/"))
    (write-region (point-min) (point-max) temp-file)
    (unwind-protect
        (progn
          (python-pytest-file temp-file)
          (delete-file temp-file)))))
