
(defun asdasd-os-encoding-convert-region (coding-from coding-to region-bounds)
  "decodes CODING-FROM to CODING-TO"
  (interactive (list (intern (completing-read "coding from:" coding-system-list))
                     (intern (completing-read "coding to:" coding-system-list))))
  (let* ((region (car region-bounds))
         (region-from (car region))
          (region-to (cdr region))
         (decode-string (buffer-substring region-from region-to)))
  (kill-region region-from region-to)
  (-> decode-string
    (encode-coding-string coding-from)
    (decode-coding-string coding-to)
    (insert))))

(defun asdasd-os-encoding-decode-broken-cyrillic-region ()
  (interactive)
  (asdasd-os-encoding-convert-region 'cp1251 'utf-8 (region-bounds)))

(defun asdasd-os-encoding-decode-broken-cyrillic-line ()
  (interactive)
  (asdasd-os-encoding-convert-region 'cp1251 'utf-8 (list `(,(line-beginning-position) . ,(line-end-position)))))

;; (defun asdasd-os-encoding-decode-broken-cyrillic-region ()
;;   (interactive)
;;   (asdasd-os-encoding-convert-region 'cp1251 'utf-8))

(defun asdasd-os-encoding-detect-region-coding ()
  ""
  (interactive)
  (message (mapconcat 'symbol-name (detect-coding-string (buffer-substring (region-beginning) (region-end))) " ")))


(use-package emacs
  :custom
  ;; (coding-system-for-read 'utf-8)
  ;; (coding-system-for-write 'utf-8)
  (default-process-coding-system '(utf-8-unix . utf-8-unix))
  (buffer-file-coding-system-explicit '(utf-8-unix utf-8-unix))

  :config
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ;
  ;; (set-buffer-process-coding-system 'nil 'nil)
  
  (unless (asdasd-os-win-wsl-p) (w32-set-system-coding-system 'utf-8-unix))
  (prefer-coding-system 'utf-8-unix)
  (set-default-coding-systems 'utf-8-unix)
  (set-terminal-coding-system 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (setq save-buffer-coding-system 'utf-8-unix)
  
    ;; backwards compatibility as default-buffer-file-coding-system
  ;; is deprecated in 23.2.
  (setq-default buffer-file-coding-system 'utf-8-unix)
  

  ;; Treat clipboard input as NIL string first; compound text next, etc.
  ;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  )

(provide 'asdasd-os-encoding)

