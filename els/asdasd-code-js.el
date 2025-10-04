(defun node-repl () (interactive)
       (setenv "NODE_NO_READLINE" "1") ;avoid fancy terminal codes
       (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))
(node-repl)

(use-package js-comint)
