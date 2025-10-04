(defun process-buffer-fields (keep-first? predicate)
  "Process fields in buffer, keeping first field if KEEP-FIRST?, 
   filtering based on PREDICATE if provided"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (not (eobp))
      (let* ((line (buffer-substring-no-properties
                    (point-at-bol) (point-at-eol)))
             (fields (split-string line))
             (process-line t))
        (when predicate
          (setq process-line (funcall predicate fields)))
        
        (when (and process-line (> (length fields) 1))
          (delete-region (point-at-bol) (point-at-eol))
          (insert (if keep-first?
                     (car fields)
                   (mapconcat #'identity
                             (cdr fields)
                             " "))))
        (forward-line)))))
;; (defun asdasd-ux-keys-copy-keybind-as-kill ()
;;   )

(defun asdasd-ux-text-flush-blank-lines ()
  ""
  (interactive)
  (flush-lines "^\\s-*$" nil nil t))


;; [2025-06-23]~ search-forward and replace-match are awful can't wrap my head
;; (defun asdasd-ux-text-split-on-substring (substring)
;;   ""
;;   (interactive "MSplit on:")
;;   ;; (search-forward "substring" and replace-match)
;;   (if (region-active-p) (goto-char (region-beginning)))
;;   (while (and (< (point) (region-end))
;;               (search-forward substring (region-end)))
;;     ;; (goto-char (match-beginning))
;;     (print (match-beginning nil))
;;       ))

(defun asdasd-ux-text-split-on-substring (substring)
  (interactive "MSplit on:\n")
  (replace-string substring (concat (if current-prefix-arg nil substring) "\n") nil (region-beginning) (region-end)))

(defun perform-action-on-regexp-matches (regexp action)
  "Perform ACTION on each regexp match in the current buffer."
  (interactive "sRegexp: \naFunction:")
  (let ((start (point-min)))
    (while (re-search-forward regexp nil t)
      (funcall action))))

(use-package emacs
:bind*
("C-c p U" . thing-copy-url)
("C-c p u" . browse-url-at-point)
("C-c p f" . find-file-at-point)
("C-c p F" . browse-url-of-file)
("C-;" . comment-line)
("C-M-;" . whole-line-or-region-comment-dwim)
("C-M-S-d" . backward-kill-sexp)
("C-c C-o" . fixup-whitespace)
(:map isearch-mode-map ("C-S-w" . kill-isearch-match)
      ("M-S-w" . copy-isearch-match))
:config
(default-input-method "russian-computer")



:config (electric-pair-mode t)
(delete-selection-mode 1)
(setq-default buffer-file-coding-system 'utf-8-unix)
:custom
(default-input-method 'russian-computer)
(bidi-paragraph-direction 'left-to-right)
(bidi-inhibit-bpa t)
(require-final-newline nil)
(mode-require-final-newline nil)
)


(defun asdasd-ux-text-yank-around-region (text-region text-beginning text-end)
"wraps TEXT-REGION in two last elements (TEXT-BEGINNING TEXT-END) of kill-ring "
(interactive (list (buffer-substring (region-beginning) (region-end))
                   (car kill-ring)
                   (cadr kill-ring)))
             
(delete-region (region-beginning) (region-end))
(insert text-beginning)
(insert text-region)
(insert text-end))



(defun asdasd-ux-text-copy-to-other-window ()
  ""
  (interactive)
  (save-excursion (kill-new (buffer-substring-no-properties (region-beginning) (region-end)))
                  (other-window 1)
                  (yank)
                  (other-window -1)))



(use-package whole-line-or-region
  :config
  )

(use-package unfill
:config )
 
(use-package fancy-dabbrev
  :bind ("M-/" . fancy-dabbrev-expand)
  :config (fancy-dabbrev-mode 1))



(use-package simple
  :straight nil
  :config (visual-line-mode 1))

;; (use-package thing-edit
;;   :preface (add-to-list 'load-path (expand-file-name "thing-edit" user-packages))
;;   :bind* ("M-W" . thing-copy-to-line-end)
;;   )

;; (use-package virtual-auto-fill)

(use-package adaptive-wrap)
