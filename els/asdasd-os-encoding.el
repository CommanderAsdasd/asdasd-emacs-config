(defun asdasd-os-encoding-convert-region (coding-from coding-to)
  "decodes CODING-FROM to CODING-TO"
  (interactive (list (intern (completing-read "coding from:" coding-system-list))
                     (intern (completing-read "coding to:" coding-system-list))))
  (let ((decode-string (buffer-substring (region-beginning) (region-end))))
  (kill-region (region-beginning) (region-end))
  (-> decode-string
    (encode-coding-string coding-from)
    (decode-coding-string coding-to)
    (insert))))

(defun asdasd-os-encoding-decode-broken-cyrillic-region ()
  (interactive)
  (asdasd-os-encoding-convert-region 'cp1251-dos 'utf-8-dos)) ;

(defun asdasd-os-encoding-detect-region-coding ()
  ""
  (interactive)
  (message (mapconcat 'symbol-name (detect-coding-string (buffer-substring (region-beginning) (region-end))) " ")))


(use-package emacs
  :custom
  ;; (coding-system-for-read 'utf-8) ; whithout it doesn't read cyrillic well
  ;; (coding-system-for-write 'utf-8)
  ;; (default-process-coding-system '(utf-8-dos . utf-8-dos))
  (default-process-coding-system '(utf-8-dos . utf-8-dos))
  (buffer-file-coding-system-explicit '(utf-8 . utf-8))
  :config
  ;; (setq default-process-coding-system '(utf-8 . utf-8)) ;
  ;; (set-buffer-process-coding-system 'nil 'nil)
  
  (w32-set-system-coding-system 'utf-8-dos)
  (prefer-coding-system 'utf-8-dos)
  (set-default-coding-systems 'utf-8-dos)
  ;; (set-terminal-coding-system 'nil)
  ;; (set-keyboard-coding-system 'nil)
  
  ;; backwards compatibility as default-buffer-file-coding-system
  ;; is deprecated in 23.2.
  ;; (setq-default buffer-file-coding-system 'nil)
  

  ;; Treat clipboard input as NIL string first; compound text next, etc.
  ;; (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  )

(provide 'asdasd-os-encoding)
