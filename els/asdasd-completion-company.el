(global-set-key (kbd "C-?") 'company-select-next-if-tooltip-visible-or-complete-selection)

;; company-mode enable file path completion
;; company-file via hippie-expand


;; add key to evil normal state
(evil-define-key 'normal comint-mode-map (kbd "<return>") 'comint-send-input)
(evil-define-key 'insert comint-mode-map (kbd "<return>") 'comint-send-input)

(provide 'asdasd-completion-company)
