(require 'asdasd-note-org-babel)

(defun asdasd-ux-text-obfuscate-region (beg end &optional seed)
  "Obfuscate region BEG END.
Letters stay letters, digits stay digits.
Optional SEED makes output deterministic."
  (interactive "r")
  (let ((state (md5 (or seed "default-seed"))))
    (cl-labels
        ((next-rand ()
           (setq state (md5 state))
           (string-to-number (substring state 0 8) 16))
         (letter-case (c)
           (if (and (>= c ?A) (<= c ?Z)) 'upper 'lower))
         (rand-letter (case)
           (let ((base (if (eq case 'upper) ?A ?a)))
             (+ base (% (next-rand) 26))))
         (rand-digit ()
           (+ ?0 (% (next-rand) 10))))
      (save-excursion
        (goto-char beg)
        (while (< (point) end)
          (let ((c (char-after)))
            (cond
             ((or (and (>= c ?a) (<= c ?z))
                  (and (>= c ?A) (<= c ?Z)))
              (delete-char 1)
              (insert-char (rand-letter (letter-case c))))
             ((and (>= c ?0) (<= c ?9))
              (delete-char 1)
              (insert-char (rand-digit)))
             (t
              (forward-char 1)))))))))



(defun asdasd-ux-text-show-all-invisible-text ()
  (remove-text-properties (point-min) (point-max) '(invisible nil)))

(defun asdasd-ux-text-delete-all-invisible-text ()
  (save-excursion
  (goto-char (point-min))
  (while (not (eobp))
    (let ((prop (get-text-property (point) 'invisible)))
      (if prop
          (delete-region
           (point)
           (or (next-single-property-change (point) 'invisible)
               (point-max)))
        (goto-char
         (or (next-single-property-change (point) 'invisible)
             (point-max))))))))

(defun asdasd-ux-text-copy-all-visible-text ()
  (interactive)
  (let ((text ""))
    (save-excursion
      (goto-char (point-min))
      (while (not (eobp))
        (let ((next (or (next-single-property-change (point) 'invisible)
                        (point-max))))
          (unless (get-text-property (point) 'invisible)
            (setq text
                  (concat text
                          (buffer-substring-no-properties (point) next))))
          (goto-char next))))
    (kill-new text)
    text))

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

;; TODO I fucking hate `search-forward' and `replace-match'
(defun asdasd-ux-text-split-on-substring (substring)
  (interactive "MSplit on:\n")
  (let ((beg (min (point) (mark)))
         (end (max (point) (mark))))
        (goto-char beg)
        (while (search-forward substring end t)
          (replace-match (concat "\n" (when current-prefix-arg substring)) nil t))))


  

;; (defun asdasd-ux-text-split-on-substring (substring)
;;   (interactive "MSplit on:\n")
;;   (replace-string substring (concat (unless current-prefix-arg substring) "\n") nil (region-beginning) (region-end)))

(defun asdasd-ux-text-split-commas-and-or-but ()
  (interactive)
  (asdasd-ux-text-split-on-substring ",")
  (asdasd-ux-text-split-on-substring "and")
  (asdasd-ux-text-split-on-substring "but")
  (asdasd-ux-text-split-on-substring " or ")
  )

(defun perform-action-on-regexp-matches (regexp action)
  "Perform ACTION on each regexp match in the current buffer."
  (interactive "sRegexp: \naFunction:")
  (let ((start (point-min)))
    (while (re-search-forward regexp nil t)
      (funcall action))))

(use-package emacs
  :bind*
  ("M-J" . join-line)
  ("M-W" . asdasd-ux-text-copy-to-other-window)
  ("C-c p U" . thing-copy-url)
  ("C-c p u" . browse-url-at-point)
  ("C-c p f" . find-file-at-point)
  ("C-c p F" . browse-url-of-file)
  ("C-;" . comment-line)
  ("C-M-;" . whole-line-or-region-comment-dwim)
  ("C-M-S-d" . backward-kill-sexp)
  ("C-c C-o" . fixup-whitespace)
  (:map prog-mode-map ("C-c C-j" . join-line))
  (:map isearch-mode-map ("C-S-w" . kill-isearch-match)
        ("M-S-w" . copy-isearch-match))
  :config (electric-pair-mode t)
  (delete-selection-mode 1)
  (setq-default buffer-file-coding-system 'utf-8-unix)
  :custom
  (default-input-method 'russian-computer)
  (bidi-paragraph-direction 'left-to-right)
  (bidi-display-reordering nil)
  (inhibit-bidi-mirroring t)
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
  "test"
  (interactive)
  (save-excursion (let ((beg (if (use-region-p) (region-beginning) (line-beginning-position)))
                        (end (if (use-region-p) (region-end) (line-end-position))))
                    (kill-new (buffer-substring-no-properties beg end))
                    (other-window 1)
                    (if current-prefix-arg (org-rich-yank) (yank))
                    (insert "
")
                    (other-window -1))))



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
