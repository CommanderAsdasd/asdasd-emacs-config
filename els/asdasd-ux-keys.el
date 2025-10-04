(defun asdasd-ux-keys-insert-key-sequence ()

  "Prints out the key sequence entered by the user."
  (interactive)
  (let* ((key-seq (read-key-sequence "Enter key sequence: " nil nil))
         (keys (mapcar 'key-description (split-string key-seq))))
    (insert (string-join keys " "))))


(defun asdasd-ux-keys-insert-bound-command-name ()
  "Inserts the command name bound to the entered key sequence."
  (interactive)
  (let* ((key-seq (read-key-sequence "Enter key sequence for command: " nil nil)))
    (insert (symbol-name (lookup-key (current-global-map) key-seq)))))


(setq asd-homerow-left "k")
(setq asd-homerow-down "o")
(setq asd-homerow-up "p")
(setq asd-homerow-right "'")
(mapc (lambda (x) (concat "S-" )) '(asd-homerow-left asd-homerow-down asd-homerow-up asd-homerow-right))
(setq asd-homerow-left-s "K")
(setq asd-homerow-down-s "O")
(setq asd-homerow-up-s "P")
(setq asd-homerow-right-s "\"")
 
 
(define-key key-translation-map (kbd "M-s") (kbd "M-x"))
(define-key key-translation-map (kbd "M-x") (kbd "M-s"))
(define-key key-translation-map (kbd "C-x") (kbd "C-s"))
(define-key key-translation-map (kbd "C-s") (kbd "C-x"))
(define-key key-translation-map (kbd "C-y") (kbd "C-z"))
(define-key key-translation-map (kbd "C-z") (kbd "C-y"))
(define-key key-translation-map (kbd "M-y") (kbd "M-z"))
(define-key key-translation-map (kbd "M-z") (kbd "M-y"))
(define-key key-translation-map (kbd "C-M-x") (kbd "C-M-s"))
(define-key key-translation-map (kbd "C-M-s") (kbd "C-M-x"))
(define-key key-translation-map (kbd "C-S-s") (kbd "C-S-x"))
(define-key key-translation-map (kbd "C-S-x") (kbd "C-S-s"))
(define-key key-translation-map (kbd "M-S-s") (kbd "M-S-x"))
(define-key key-translation-map (kbd "M-S-x") (kbd "M-S-s"))
(define-key key-translation-map (kbd "C-M-S-s") (kbd "C-M-S-x"))
(define-key key-translation-map (kbd "C-M-S-x") (kbd "C-M-S-s"))
(define-key function-key-map [?\C-x] nil)
(define-key function-key-map [?\M-s] nil)
(define-key key-translation-map (kbd "C-g") (kbd "C-q"))
(define-key key-translation-map (kbd "C-q") (kbd "C-g"))
(define-key key-translation-map (kbd "C-S-d") (kbd "DEL"))
 
;; * homerow
;;
;; ** C-
(define-key key-translation-map (kbd "C-k") (kbd "C-b"))
(define-key key-translation-map (kbd "C-f") (kbd "C-k")) ; mnemonic: flush-line
(define-key key-translation-map (kbd "C-'") (kbd "C-f")) ;
(define-key key-translation-map (kbd "C-b") (kbd "C-o")) ; mnemonic: before-line
(define-key key-translation-map (kbd "C-o") (kbd "C-n")) ;
(define-key key-translation-map (kbd "C-n") (kbd "C-'")) ;
;; ** M-
(define-key key-translation-map (kbd "M-k") (kbd "M-b"))
(define-key key-translation-map (kbd "M-f") (kbd "M-k")) ; mnemonic: flush-line
(define-key key-translation-map (kbd "M-'") (kbd "M-f")) ;
(define-key key-translation-map (kbd "M-b") (kbd "M-o")) ; mnemonic: before-line
(define-key key-translation-map (kbd "M-o") (kbd "M-n")) ;
(define-key key-translation-map (kbd "M-n") (kbd "M-'")) ;
 
 
;; ** C-M
(define-key key-translation-map (kbd "C-M-k") (kbd "C-M-b"))
(define-key key-translation-map (kbd "C-M-f") (kbd "C-M-k")) ; mnemonic: flush-line
(define-key key-translation-map (kbd "C-M-'") (kbd "C-M-f")) ;
(define-key key-translation-map (kbd "C-M-b") (kbd "C-M-o")) ; mnemonic: before-line
(define-key key-translation-map (kbd "C-M-o") (kbd "C-M-n")) ;
(define-key key-translation-map (kbd "C-M-n") (kbd "C-M-'"))
 
;; (define-key key-translation-map (kbd "C-M-h") (kbd "C-M-h"))
 
 
(defun asdasd-ux-keys-copy-keybind-as-kill ()
  "Kill-new out the key sequence entered by the user."
  (interactive)
  (let* ((key-seq (read-key-sequence "Enter key sequence: " nil nil))
         (keys (mapcar 'key-description (split-string key-seq))))
    (kill-new (string-join keys " "))))
 


(defun asdasd-ux-keys-copy-keybind-function-as-kill (&optional key-sequence)
  "Kill-New the name of the function bound to KEY-SEQUENCE.
If KEY-SEQUENCE is omitted, prompt for one."
  (interactive
   (list (read-key-sequence "Key sequence function name: ")))
  (let* ((function-name (lookup-key (current-global-map) (kbd key-sequence)))
         )
    (kill-new (symbol-name function-name))))



(define-key key-translation-map (kbd "C-l") (kbd "DEL"))
 

(use-package emacs
  :bind*
  ;; ("C-;" . next-line)
  ;; ("C-'" . previous-line)
  ;; ("C-l" . backward-char)
  ;; ("C-\\" . forward-char)            ;
  ;; ("M-[" . next-history-element)
  ;; ("С-|" . undo-redo)
  ;; ("С-\\" . undo)
  ("C-/" . undo)         ;
  ;; ("<return>" . help-command) 
  ("C-S-j" .  meow-insert-exit)
  ("C-x C-z" . find-file)
  ("M-[" . down-list)
  ("M-]" . backward-up-list)
  ("M-l" . backward-kill-word)
  ("M-L" . kill-word)
  ("C-d" . duplicate-dwim)
  ("C-S-l" . delete-char)
  ("M-C" . downcase-dwim)
  ("C-M-l" . backward-kill-sexp)
  ("C-M-S-l" . kill-whole-line)
  ("C-S-f" . kill-whole-line)
  ("M-Q" . async-shell-command)
  ("<insert>" . clipboard-yank))



(use-package help-at-pt
  :bind* (:map help-map
        ("h" . asdasd-ux-keys-insert-key-sequence)
        ("H" . asdasd-ux-keys-insert-bound-command-name)))
  ;; ("C-")-
  ;; :map minibuffer-mode-map
  ;;                               ("C-c C-c" . keyboard-quit);
  
(provide 'asdasd-ux-keys)
