(modular-config-load-modules '(asdasd-general))

(winner-mode)


(defun slide-buffer (dir)
  "Move current buffer into window at direction DIR.
DIR is handled as by `windmove-other-window-loc'."
  (require 'windmove)
  (let ((buffer (current-buffer))
        (target (windmove-find-other-window dir)))
    (if (null target)
        (user-error "There is no window %s from here" dir)
      (switch-to-prev-buffer)
      (select-window target)
      (switch-to-buffer buffer nil t))))

(defun slide-buffer-up () (interactive) (slide-buffer 'up))
(defun slide-buffer-down () (interactive) (slide-buffer 'down))
(defun slide-buffer-left () (interactive) (slide-buffer 'left))
(defun slide-buffer-right () (interactive) (slide-buffer 'right))

;; define evil map for previous and next buffer

;; map to capital H slide buffer left in evil normal mode
(evil-define-key nil evil-window-map (kbd "H") 'slide-buffer-left)

;; same for JKL
(evil-define-key nil evil-window-map (kbd "J") 'slide-buffer-down)
(evil-define-key nil evil-window-map (kbd "K") 'slide-buffer-up)
(evil-define-key nil evil-window-map (kbd "L") 'slide-buffer-right)

(define-prefix-command 'buffer-swticher-map)
;; (define-key evil-window-map (kbd "[") 'previous-buffer)
;; (define-key evil-window-map (kbd "]") 'next-buffer)
;; use-package bind repeatable key:
(general-define-key
 :keymaps 'evil-window-map
 "[" '(previous-buffer :repeat t)
 "]" '(next-buffer :repeat t))


(define-key global-map (kbd "C-c <C-left>") 'windmove-left)
(define-key global-map (kbd "C-c <C-down>") 'windmove-down)
(define-key global-map (kbd "C-c <C-up>") 'windmove-up)
(define-key global-map (kbd "C-c <C-right>") 'windmove-right)

(use-package ace-window
  :straight t
  ;; :bind (
  )
