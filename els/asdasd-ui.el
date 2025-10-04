
(use-package warnings
  :config (add-to-list 'display-buffer-alist
                       
                       '("\\*Warning\\*" ;; Adjust the buffer name pattern to match your warning buffer's name
                         (display-buffer-reuse-window display-buffer-in-background)
                         (reusable-frames . 0))))


(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)


(defun what-face (pos)
  "Describe the face at POS."
  (interactive "d")
  (let ((face (or (get-char-property pos 'read-face-name)
                  (get-char-property pos 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(use-package ansi-color
  :custom
  (ansi-color-for-compilation-mode t "Расцветка буфера *compile*")
  :hook
  (compilation-filter . ansi-color-compilation-filter))

;; (use-package shaoline
;;   :straight (:host github :repo "11111000000/shaoline"))
