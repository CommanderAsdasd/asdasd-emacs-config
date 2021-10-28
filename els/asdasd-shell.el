


(general-define-key
 :predicate 'comint-mode
 "M-r" 'helm/bash-history)

(defconst my-leader "C-c")

(general-create-definer my-leader-def
  ;; :prefix my-leader
  ;; or without a variable
  :prefix "C-c")

;; ** Global Keybindings
(my-leader-def
  "a" 'org-agenda
  "b" 'counsel-bookmark
  "c" 'org-capture)

;; ** Mode Keybindings
(my-leader-def
  :keymaps 'clojure-mode-map
  ;; bind "C-c C-l"
  "C-l" 'cider-load-file
  "C-z" 'cider-switch-to-repl-buffer)


(provide 'asdasd-shell)
