(use-package spaceleader
  :custom (leader-nnorm-key "M-o")
  :straight
  (spaceleader :type git :host github :repo "mohkale/spaceleader")
  :config
  (leader-declare-prefix "f" "file")
  (leader-declare-prefix "s" "search")
  (leader-declare-prefix "e" "eval")
  (leader-set-keys "ff" 'find-file
    "s" 'save-buffer
    "w" 'evil-window-map
    "b" 'switch-to-buffer
    "h" 'help-command
    "ed" 'eval-defun
    "<SPC>" 'execute-extended-command
    "r" 'bookmark-map
    ))
