(general-define-key
 :mode 'python-mode
 "C-c b" 'python-shell-send-buffer)

;; setup python documentation
(use-package python-docstring
  :ensure t
  :config
  (add-hook 'python-mode-hook 'python-docstring-mode))


;; find python documentation:
;; http://www.emacswiki.org/emacs/PythonMode#toc4

;; set C-c C-b as python-shell-send-buffer

(provide 'asdasd-programming-python)
