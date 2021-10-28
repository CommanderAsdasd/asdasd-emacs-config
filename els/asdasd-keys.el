; Methods: native
					;* M-q map

(use-package general
  :config
  )


(general-define-key
 ;; NOTE: keymaps specified with :keymaps must be quoted
 :keymaps 'mq-map
 "w" 'woman
 )


(progn (define-prefix-command 'mq-map)
       (global-set-key (kbd "M-q") 'mq-map))
       
(define-key mq-map (kbd "a") 'ace-link)
(define-key mq-map (kbd "q") 'ace-window)
(define-key mq-map (kbd "p") (define-prefix-command 'print-map))
(define-key 'print-map (kbd "d") 'print-dir)




(global-set-key (kbd "C-c e") 'everything)

;; 'hs-show-all
;; 'hs-hide-all

(define-key mq-map (kbd "i") 'ace-link)




(provide 'asdasd-keys)

;* M-q map ends here
