;; (defhydra my/lispy-cheat-sheet (:hint nil :foreign-keys run)
;;   ("<f14>" nil :exit t))
;; ()
;;   (cl-loop for x in bindings
;;            unless (string= "" (elt x 2))
;;            collect
;;            (list (car x)
;;                  (intern (elt x 1))
;;                  (when (string-match "lispy-\\(?:eval-\\)?\\(.+\\)"
;;                                      (elt x 1))
;;                    (match-string 1 (elt x 1)))
;;                  :column
;;                  (elt x 2)))

(provide 'asdasd-ux-keys-hydra)
