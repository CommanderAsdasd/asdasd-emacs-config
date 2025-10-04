(asdasd-ux-config-load '("asdasd-ux-keys-homerow.el" "asdasd-ui-cursor.el"))

(defun asdasd-keys-meow-reset-compare-winwows ()
  "reset positions and compare"
  (interactive)
  (beginning-of-buffer)
  (other-window 1)
  (beginning-of-buffer)
  (compare-windows t))

(defun lookup-bind (bind)
  "Return the key description
(s) for BIND."
  (let ((bindings (where-is-internal bind)))
    (if bindings
        (mapconcat 'key-description bindings " or ")
      "No bindings found.")))


;; (defun asdasd-keys-meow-god-local-mode ()
;;   "disable meow to reach god"
;;   )


(add-hook 'god-local-mode-hook 'asdasd-keys-meow-swtich-global-mode)

(defun asdasd-keys-meow-swtich-global-mode ()
  (meow-global-mode (if meow-global-mode 0 1)))

(defun asdasd-keys-meow-switch-emacs-mode ()
  (interactive)
  (asdasd-keys-meow-swtich-global-mode)
  (asdasd-keys-meow-cursor-mode-check)
  (message "%s: %s" (symbol-name 'meow-global-mode) meow-global-mode))

(defun asdasd-keys-meow-cursor-mode-check (&optional buffer1 buffer2)
  (cond
   ((eq meow-insert-mode t) (set-cursor-color  "red"))
   ((eq (or meow-normal-mode meow-motion-mode) t) (set-cursor-color "green"))
   ((eq (and (meow-normal-mode-p) (meow-insert-mode-p)) nil) (set-cursor-color "blue")))
  ;; (if
  ;;   (if (and (eq meow-normal-mode nil)  (eq meow-insert-mode nil))
  ;;     ))
  )



(require 'asdasd-ux-keys)
(require 'emacs)

(defun asdasd-keys-meow-switch-insert-mode ()
  ""
  (interactive)
  (if (meow-insert-mode-p) (meow-insert-exit) (meow-insert))
  )


(use-package meow
  ;; :straight (:host github :repo "meow-edit/meow")
  :demand t
  :init (setq meow--kbd-delete-char "C-S-l")
  (add-to-list 'meow-mode-state-list '(minibuffer-mode . normal))
  :bind*
  ("C-M-S-j" . asdasd-keys-meow-switch-emacs-mode)
  ("C-S-j" .  asdasd-keys-meow-switch-insert-mode)
  :custom
  (meow-use-clipboard t)
  ;; (meow--kbd-delete-char "C-S-l")
  (meow-select-on-change nil)
  (meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  :config
  (meow-global-mode 1)
  (add-hook 'meow-switch-state-hook 'asdasd-keys-meow-cursor-mode-check)
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . "H-j")
   '("k" . "H-k")
   '("SPC" . self-insert-command)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet))
  (meow-motion-overwrite-define-key 
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '("<" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   ;; '("a" . )
   ;; '("A" . )
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   ;; '("c" . )
   ;; '("d" . )
   ;; '("D" . )
   '("e" . meow-next-word)
   '("e" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-block)
   '("j" . highlight-symbol-at-point)
   '("J" . unhighlight-regexp)
   '("i" . avy-goto-char-timer)
   '("I" . link-hint-open-link)
   `(,asd-homerow-left . meow-left)
   `(,asd-homerow-down . meow-next)
   `(,asd-homerow-up . meow-prev)
   `(,asd-homerow-right . meow-right)
   `(,asd-homerow-left-s . meow-left-expand)
   `(,asd-homerow-down-s . meow-next-expand)
   `("P" . meow-prev-expand)
   `("\"" . meow-right-expand)
   '("m" . (lambda () (interactive)(setq unread-command-events (listify-key-sequence "\C-m"))))
   '("n" . meow-search)
   '("N" . meow-pop-search)
   ;; '("z" . )
   ;; '("Z" . )
   '("q" . meow-cancel-selection)
   '("Q" . eval-last-sexp)
   '("E" . eval-defun)
   ;; '("r" . )
   '("R" . meow-swap-grab)
   ;; '("l" . )
   ;; '("L" . )
   '("t" . meow-till)
   ;; '("u" . )
   ;; '("U" . )
   '("v" . meow-visit)
   '("s" . meow-mark-word)
   '("S" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("w" . meow-save)
   '("W" . meow-sync-grab)
   '("y" . meow-pop-selection)          ;
   ;; '(";" . )                ;
   ;; '(":" . )                ;
   ;; '(":" . whole-line-or-region-comment-dwim) ;
   '("<escape>" . ignore)               ;
   '("/" . isearch-forward-regexp)      ;
   '("?" . isearch-backward-regexp)     ;
   '("|" . self-insert-command)
   '("`" . compare-windows)
   '("~" . asdasd-keys-meow-reset-compare-winwows)
   ;; '("(" . )
   ;; '(")" . )
   '("h" . help-command)
   )
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '("<" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("e" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-block)
   '("j" . highlight-symbol-at-point)
   '("J" . unhighlight-regexp)
   '("i" . avy-goto-char-timer)
   '("I" . link-hint-open-link)
   `(,asd-homerow-left . meow-left)
   `(,asd-homerow-down . meow-next)
   `(,asd-homerow-up . meow-prev)
   `(,asd-homerow-right . meow-right)
   `(,asd-homerow-left-s . meow-left-expand)
   `(,asd-homerow-down-s . meow-next-expand)
   `("P" . meow-prev-expand)
   `("\"" . meow-right-expand)
   '("M" . meow-join)
   '("m" . (lambda () (interactive)(setq unread-command-events (listify-key-sequence "\C-m"))))
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("z" . meow-yank)
   '("Z" . meow-yank-pop)
   '("q" . meow-cancel-selection)
   '("Q" . eval-last-sexp)
   '("E" . eval-defun)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("l" . meow-kill)
   '("L" . meow-kill-whole-line)
   '("t" . meow-till)
   '("/" . meow-undo)
   '("?" . undo-redo)
   '("u" . isearch-forward-regexp)      ;u for "uncover"
   '("U" . isearch-backward-regexp)     ;
   '("v" . meow-visit)
   '("s" . meow-mark-word)
   '("S" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("w" . meow-save)
   '("W" . meow-sync-grab)
   '("y" . meow-pop-selection)          ;
   '(";" . meow-comment)                ;
   '(":" . comment-line)                ;
   ;; '(":" . whole-line-or-region-comment-dwim) ;
   '("<escape>" . ignore)               ;
   '("|" . self-insert-command)
   '("`" . compare-windows)
   '("~" . asdasd-keys-meow-reset-compare-winwows)
   '("(" . insert-parentheses)
   '(")" . (lambda () (interactive)(insert ")")))
   '("h" . help-command)
   '("@" . (lambda () (interactive) (self-insert-command 1 ?\")))
   )
  ;; (defvar asdasd-keys-meow-python-e-map (make-sparse-keymap))
  ;; (defvar my-e-prefix (let ((map (make-sparse-keymap))) map))
  
  (add-hook 'python-mode-hook '(lambda ()
                                   (defvar my-e-prefix (let ((map (make-sparse-keymap))) map))
                                   (define-key my-e-prefix (kbd "e") #'python-shell-send-region)
                                   (meow-normal-define-key
                                    '("e" . my-e-prefix))))


  ;; :bind* (:map meow-normal-state-keymap
  ;;             ("ee" .  python-shell-send-region))
  )



(provide 'asdasd-keys-meow)
