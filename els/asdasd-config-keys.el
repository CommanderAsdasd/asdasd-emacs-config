; Methods: native
;* M-q map

(progn (define-prefix-command 'mq-map)
(global-set-key (kbd "M-q") 'mq-map)
(define-key mq-map (kbd "a") 'ace-link)
(define-key mq-map (kbd "q") 'ace-window)
(define-key mq-map (kbd "p") (define-prefix-command 'print-map))
(define-key 'print-map (kbd "d") 'print-dir)
)


;* M-q map ends here
