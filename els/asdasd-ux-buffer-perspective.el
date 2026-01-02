(defun asdasd-ux-buffer-perspective-embark-remove-buffer (candidate)
  (persp-remove-buffer candidate))

(defun asdasd-ux-buffer-perspective-embark-rename (candidate)
  (persp-switch candidate)
  (persp-rename (persp-prompt candidate)))

(defun asdasd-ux-buffer-perspective-remove-current-buffer ()
  (interactive)
  (persp-remove-buffer (buffer-name)))


(use-package perspective
  :config (persp-mode)
  :bind*   ;; ("C-x k p" . asdasd-ux-buffer-perspective-embark-remove-buffer)
  (:map embark-general-map ;
        ("p" . asdasd-ux-buffer-perspective-embark-remove-buffer)
        ("r" . asdasd-ux-buffer-perspective-embark-rename))
  (:map perspective-map 
        ("K" . asdasd-ux-buffer-perspective-remove-current-buffer))
  
  ;; ("C-c p s" . persp-switch)
  :bind-keymap ("C-c p p" . perspective-map))
